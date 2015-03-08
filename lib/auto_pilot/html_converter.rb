require_relative 'template_helper'
module AutoPilot
  class HtmlConverter
    include AutoPilot::TemplateHelper
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

    # TODO: base this on initial options
    def write_md_file(folder = DEFAULT_BLOG_FOLDER)
      system 'mkdir', '-p', folder
      new_file =  file_name(h1)
      File.open("#{folder}/#{new_file}.html", 'w') { |file| file.write(html_template) }
    end
  end
end
