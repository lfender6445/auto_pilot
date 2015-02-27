require 'nokogiri'
module AutoPilot
  class DocumentParser
    # title
    # #question-header h1 .question-hyperlink

    # question
    # #question

    # my answer
    # #answer-25536701 .post-text
    attr_reader :doc, :question_id, :answer_id
    def initialize(doc, question_id, answer_id)
      @doc         = doc
      @question_id = question_id
      @answer_id   = answer_id
    end


    def title_text
      document.search(xml_map[:h1]).each do |node|
        binding.pry
      end
    end

    def xml_map
      @xml_map ||= {
        h1:       '#question-header h1 .question-hyperlink',
        question: '#question',
        answer:   "#anwer-#{answer_id} .post-text"
      }
    end
  end
end
