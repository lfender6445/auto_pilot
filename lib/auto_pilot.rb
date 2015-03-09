require 'ruby-stackoverflow'
require 'dotenv'

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

    def get_answers(_user = '', _options = {})
      # TODO: id stubs, replace with API
      question_ids = [19_348_076]
      answer_ids   = [25_536_701]
      parsed_documents = []
      question_ids.each do |id|
        doc = Request.fetch page_with_my_answer(id)
        parsed_documents << DocumentParser.new(doc, id, answer_ids.first)
      end
      parsed_documents
    end

    def get_api_answers
      set_auth_data
      parsed_documents = []
      answers = AutoPilot::API.new.get_answers
      answers.each do |answer|
        question_id = answer[:question_id]
        answer_id   = answer[:answer_id]
        doc = Request.fetch page_with_my_answer(question_id)
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

    def set_auth_data
      Dotenv.load
      AutoPilot.configuration.secret = ENV['SO_SECRET']
      AutoPilot.configuration.key    = ENV['SO_KEY']
    end
  end
end
