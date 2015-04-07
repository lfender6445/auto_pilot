require 'ruby-stackoverflow'
module AutoPilot
  class API
    attr_reader :user, :options, :answers

    def initialize(user = AutoPilot.configuration.id, options = {})
      @user    = user
      @options = options
      @answers = []
      add_config_client_key
    end

    def get_answers
      Log.green "fetching information for id #{AutoPilot.configuration.id} via stackoverflow api"
      pages.each do |page|
        begin
          Log.green "fetching answers for page #{page}"
          response = answer_response(page)
          answers << response.data.first.answers
        rescue => e
          Log.red "An error occured: #{e}"
          Log.red '- AutoPilot will continue downloading your answers'
          break
        end
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
      throttle { RubyStackoverflow.users_with_answers([AutoPilot.configuration.user_id], 'page' => page) }
    end

    def add_config_client_key
      if key = AutoPilot.configuration.key
        RubyStackoverflow.configure { |config| config.client_key = key }
      else
        Log.yellow 'you can execute more requests with an API key - http://api.stackexchange.com/'
      end
    end

    def filtered(answers)
      if answers.length > 0
        filtered_answers = answers.flatten.uniq.select { |answer| answer.score > (AutoPilot.configuration.score_threshold || 0) }
        [].tap do |arr|
          filtered_answers.each do |answer|
            arr << { answer_id: answer.answer_id, question_id: answer.question_id }
          end
        end
      else
        fail "could not find answers for id #{AutoPilot.configuration.user_id}"
      end
    end

    def fail(error)
      Log.red error
      abort
    end
  end
end
