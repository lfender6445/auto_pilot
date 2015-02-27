require "ruby-stackoverflow"

require_relative "auto_pilot/request"
require_relative "auto_pilot/document_parser"

module AutoPilot
  def answers_for(user, options={})
    # id stubs
    question_ids = [19348076]
    answer_ids   = [25536701]
    parsed_documents = []
    question_ids.each do |id|
      page_with_my_answer = "http://stackoverflow.com/questions/#{id}/"
      doc = Request.fetch page_with_my_answer
      parsed_doc = DocumentParser.new doc, id, answer_ids.first
      parsed_documents << doc
    end
  end


  module_function :answers_for


end
