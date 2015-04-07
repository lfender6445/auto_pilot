require_relative 'core/string'
require_relative 'auto_pilot/configure'
require_relative 'auto_pilot/api'
require_relative 'auto_pilot/request'
require_relative 'auto_pilot/document_parser'
require_relative 'auto_pilot/markdown_converter'
require_relative 'auto_pilot/html_converter'

module AutoPilot
  class << self
    BASE_URL = 'http://stackoverflow.com/questions'

    def get_api_answers
      parsed_documents = []
      answers = AutoPilot::API.new.get_answers
      answers.each do |answer|
        question_id = answer[:question_id]
        answer_id   = answer[:answer_id]
        url = page_with_my_answer(question_id)
        doc = Request.fetch url
        # Log.green "question id #{question_id} | answer id #{answer_id}"
        parsed_documents << DocumentParser.new(doc, question_id, answer_id)
      end
      parsed_documents
    end

    def page_with_my_answer(id)
      "#{BASE_URL}/#{id}/"
    end

    def write_files(parsed_documents)
      parsed_documents.each do |doc|
        HtmlConverter.new doc     if AutoPilot.configuration.format.include? :html
        MarkdownConverter.new doc if AutoPilot.configuration.format.include? :md
      end
    end
  end
end
