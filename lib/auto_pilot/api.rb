module AutoPilot
  class Api

    attr_reader :user, :options

    def initialize(user, options = {})
      raise 'must supply valid user' if user.nil?
      @user    = user
      @options = options

      # TODO: move to configuration class
      # date  = options[:date] || get_todays_date
      pages = options[:page] || 1 || Array(1..3)
      user_id = RubyStackoverflow.users({inname: user}).data.first.user_id
      answers = []
      pages.each do |page|
        response = RubyStackoverflow.users_with_answers([user_id], page: page)
        answers << response.data.first.answers
        # user has no more answers
        return unless response.has_more
      end
      answers = filtered(answers)
      question_ids = answers.map(&:question_id)
      # TODO: pass something like the following to doc parser
      # aq_obj = answers.map {|answer| {question: answer.question_id, id: answer.answer_id}}
    end

    # NOTES
    # not very useful. returns all answers for given question but NO content
    # compose a URL to grab the question title and answer instead
    # question_response = RubyStackoverflow.answers_of_questions(question_ids, {order: 'asc'})

    # TODO: move to configurable option
    def get_todays_date
      Date.today.to_s
    end

    def filtered(answers)
      if answers.length
        answers = answers.flatten.uniq
        answers.select { |answer| answer.score > 0 }
      else
        raise 'could not find answers for given user'
      end
    end
  end
end
