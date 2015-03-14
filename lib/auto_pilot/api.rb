require 'ruby-stackoverflow'
module AutoPilot
  class API
    attr_reader :user, :options, :answers

    def initialize(user = AutoPilot.configuration.user, options = {})
      @user    = user
      @options = options
      @answers = []
      add_config_client_key
    end

    def get_answers
      Log.green "fetching information for #{AutoPilot.configuration.user} via stackoverflow api"
      pages.each do |page|
        response = answer_response(page)
        answers << response.data.first.answers
        break unless response.has_more
      end
      filtered(answers)
    end

    def pages
      Array(1..(AutoPilot.configuration.max_pages || 3))
    end

    # https://api.stackexchange.com/docs/throttle
    # NOTE: While not strictly a throttle, the Stack Exchange API employs heavy caching and as such no application should make semantically identical requests more than once a minute.
    def throttle
      sleep(AutoPilot.configuration.throttle || 3)
      yield if block_given?
    end

    private

    def answer_response(page)
      throttle { RubyStackoverflow.users_with_answers([user_id], 'page' => page) }
    end

    def add_config_client_key
      if key = AutoPilot.configuration.key
        RubyStackoverflow.configure { |config| config.client_key = key }
      else
        Log.yellow 'by adding an api key to your config you can execute more requests - http://api.stackexchange.com/'
      end
    end

    def user_id
      throttle
      if user_response.data
        user_response.data.first.user_id
      else
        if error = user_response.error
          fail "#{error.error_message} | #{error.error_name} | #{error.error_code}"
        end
      end
    end

    def user_response
      @response ||= RubyStackoverflow.users(inname: user)
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
