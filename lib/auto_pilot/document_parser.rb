require 'nokogiri'
module AutoPilot
  class DocumentParser

    attr_reader :doc, :question_id, :answer_id
    def initialize(doc, question_id, answer_id)
      @doc         = Nokogiri::HTML(doc)
      @question_id = question_id
      @answer_id   = answer_id
      title_html
    end

    def title_html
      doc.css(xml_map[:h1]).inner_html
    end

    def title_html
      doc.css(xml_map[:h1]).text
    end

    def question_html
      doc.css(xml_map[:question]).inner_html
    end

    def question_text
      doc.css(xml_map[:question]).text # you can also call inner_html for semantic formatting
    end

    def answer_html
      doc.css(xml_map[:answer]).inner_html
    end

    def answer_text
      doc.css(xml_map[:answer]).text
    end

    def xml_map
      @xml_map ||= {
        h1:       '#question-header h1 .question-hyperlink',
        question: '#question .post-text',
        answer:   "#answer-#{answer_id} .post-text"
      }
    end
  end
end
