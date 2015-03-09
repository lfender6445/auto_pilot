module AutoPilot
  class API
    attr_reader :user, :options

    def initialize(user = AutoPilot.configuration.user, options = {})
      fail 'must supply valid user' if user.nil?
      @user    = user
      @options = options
    end

    def get_answers
      answers = []
      pages = options[:pages] || [1] || Array(1..AutoPilot.configuration.max_pages)
      Log.green 'fetching user information from stackoverflow'
      pages.each do |page|
        opts = api_options.merge(page: page)
        throttle
        response = RubyStackoverflow.users_with_answers([user_id], opts)
        answers << response.data.first.answers
        return unless response.has_more
      end
      filtered(answers)
    end

    private

    # https://api.stackexchange.com/docs/throttle
    # NOTE: While not strictly a throttle, the Stack Exchange API employs heavy caching and as such no application should make semantically identical requests more than once a minute.
    def throttle
      sleep(10)
    end

    def api_options
      hsh = {}
      if key = AutoPilot.configuration.key
        hsh[:key] = key
      end
      #if secret = AutoPilot.configuration.secret
      #  hsh[:secret] = secret
      #end
      hsh
    end

    def user_id
      if user_response.data.nil?
        if error = user_response.error
          fail "#{error.error_message} | #{error.error_name} | #{error.error_code}"
        end
      else
        user_response.data.first.user_id
      end
    end

    def user_response
      @response ||= RubyStackoverflow.users({inname: user}.merge(api_options))
      throttle
      @response
    end

    def filtered(answers)
      if answers.length > 0
        filtered_answers = answers.flatten.uniq.select { |answer| answer.score > 0 }
        [].tap do |arr|
          filtered_answers.each do |answer|
            arr << { answer_id: answer.answer_id, question_id: answer.question_id }
          end
        end
      else
        fail "could not find answers for #{AutoPilot.configuration.user}"
      end
    end

    def fail(error)
      Log.red error
      abort
    end

  end
end
