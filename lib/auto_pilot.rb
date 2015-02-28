require "ruby-stackoverflow"

require_relative "auto_pilot/request"
require_relative "auto_pilot/document_parser"
require_relative "auto_pilot/markdown_converter"

module AutoPilot
  def get_answers(user='', options={})
    # TODO: id stubs, replace with API
    question_ids = [19348076]
    answer_ids   = [25536701]
    parsed_documents = []
    question_ids.each do |id|
      page_with_my_answer = "http://stackoverflow.com/questions/#{id}/"
      doc = Request.fetch page_with_my_answer
      parsed_doc = DocumentParser.new(doc, id, answer_ids.first)
      parsed_documents << parsed_doc
    end
    parsed_documents.each do |doc|
      MarkdownConverter.new doc
    end
  end
  module_function :get_answers
end
