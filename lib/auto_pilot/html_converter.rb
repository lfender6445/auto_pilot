require_relative 'template_helper'
module AutoPilot
  class HtmlConverter
    include AutoPilot::TemplateHelper
    attr_reader :doc, :h1, :question, :answer

    DEFAULT_BLOG_FOLDER  =  './blog'

    def initialize(doc)
      @h1       = doc.title_html
      @question = doc.question_html
      @answer   = doc.answer_html
      write_html_file
    end

    private

    def to_html(html)
      html
    end

    def delimiter
      '<hr />'
    end

    def html_template
      @html ||= <<-EOS
        #{h1}
        #{question}
        #{delimiter}
        #{answer}
      EOS
    end

    # TODO: base this on initial options
    def write_html_file(folder = AutoPilot.configuration.folder)
      system 'mkdir', '-p', (folder || DEFAULT_BLOG_FOLDER)
      new_file =  file_name(h1)
      File.open("#{folder}/#{new_file}.html", 'w') do |file|
        file.write(html_template)
        Log.green "- added file ./#{folder}/#{new_file}.html"
      end
    end
  end
end
