require 'reverse_markdown'
module AutoPilot
  class MarkdownConverter

    attr_reader :doc, :h1, :question, :answer

    def initialize(doc)
      @h1       = to_markdown doc.title_html
      @question = to_markdown doc.title_html
      @answer   = to_markdown doc.answer_html
    end

    private

    def to_markdown(html)
      ReverseMarkdown.convert html
    end
  end
end
