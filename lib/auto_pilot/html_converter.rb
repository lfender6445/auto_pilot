require 'reverse_markdown'
module AutoPilot
  class HtmlConverter
    attr_reader :doc, :h1, :question, :answer

    DEFAULT_BLOG_FOLDER  =  './blog'

    def initialize(doc)
      @h1       = to_markdown doc.title_html
      @question = to_markdown doc.question_html
      @answer   = to_markdown doc.answer_html
      write_html_file
    end

    private

    def to_html(html)
      html
    end

    def html_template
      @html ||= <<-EOS
        #{h1}
        #{question}
        #{answer}
      EOS
    end

    def write_md_file(folder = DEFAULT_BLOG_FOLDER)
      system 'mkdir', '-p', folder
      File.open("#{folder}/index.html", 'w') { |file| file.write(html_template) }
    end
  end
end
