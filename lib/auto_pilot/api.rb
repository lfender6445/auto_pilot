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
      pages = options[:pages] || Array(1..AutoPilot.configuration.max_pages)
      Log.green 'fetching user information from stackoverflow'
      pages.each do |page|
        response = RubyStackoverflow.users_with_answers([user_id])
        answers << response.data.first.answers
        return unless response.has_more
      end
      filtered(answers)
    end

    private

    def user_id
      if response.data.nil?
        if error = response.error
          fail "#{error.error_message} | #{error.error_name} | #{error.error_code}"
        end
      else
        response.data.first.user_id
      end
    end

    def response
      RubyStackoverflow.users(inname: user)
    end

    def filtered(answers)
      if answers.length
        filtered_answers = answers.flatten.uniq.select { |answer| answer.score > 0 }
        [].tap do |arr|
          filtered_answers.each do |answer|
            arr << { answer_id: answer.answer_id, question_id: answer.question_id }
          end
        end
      else
        fail 'could not find answers for given user'
      end
    end

    def fail(error)
      Log.red error
      abort
    end

  end
end
