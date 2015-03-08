require 'ruby-stackoverflow'

require_relative 'auto_pilot/request'
require_relative 'auto_pilot/document_parser'
require_relative 'auto_pilot/markdown_converter'

module AutoPilot
  def get_answers(_user = '', options = { file_type: 'md' })
    # TODO: id stubs, replace with API
    question_ids = [19_348_076]
    answer_ids   = [25_536_701]
    parsed_documents = []
    question_ids.each do |id|
      page_with_my_answer = "http://stackoverflow.com/questions/#{id}/"
      doc = Request.fetch page_with_my_answer
      parsed_doc = DocumentParser.new(doc, id, answer_ids.first)
      parsed_documents << parsed_doc
    end
    parsed_documents.each do |doc|
      if options[:file_type] == 'html'
        MarkdownConverter.new doc
      else
        HtmlConverter.new doc
      end
    end
  end
  module_function :get_answers
end
