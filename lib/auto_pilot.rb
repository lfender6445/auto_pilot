require "ruby-stackoverflow"

require_relative "auto_pilot/request"

module AutoPilot
  def answers_for(user, options={})
    # id stubs
    question_ids = [19348076]
    answer_ids   = [25536701]
    documents = []
    question_ids.each do |id|
      page_with_my_answer = "http://stackoverflow.com/questions/#{id}/"
      doc = Request.fetch page_with_my_answer
      documents << doc
    end
    binding.pry
  end


  module_function :answers_for


end
