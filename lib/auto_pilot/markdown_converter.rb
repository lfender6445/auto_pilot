require 'reverse_markdown'
module AutoPilot
  class MarkdownConvert
    attr_reader :doc
    def initialize(doc)
      @h1       = ReverseMarkdown.convert doc.title_html
      @question = ReverseMarkdown.convert doc.title_html
      @answer   = ReverseMarkdown.convert doc.answer_html
    end
  end
end
