require 'reverse_markdown'
module AutoPilot
  class MarkdownConverter

    attr_reader :doc, :h1, :question, :answer

    DEFAULT_BLOG_FOLDER  =  './blog' # TODO: create this folder if it doesn't exist?

    def initialize(doc)
      @h1       = to_markdown doc.title_html
      @question = to_markdown doc.question_html
      @answer   = to_markdown doc.answer_html
      write_md_file
    end

    private

    def to_markdown(html)
      ReverseMarkdown.convert html
    end

    def md_template
      @markdown ||= <<-EOS
        #{h1}
        #{question}
        #{answer}
      EOS
    end

    def write_md_file(folder=DEFAULT_BLOG_FOLDER)
      system 'mkdir', '-p', folder
      File.open("#{folder}/index.md", 'w') { |file| file.write(md_template) }
    end
  end
end
