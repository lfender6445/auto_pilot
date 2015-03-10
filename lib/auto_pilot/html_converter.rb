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

    # TODO: strip special chars
    # TODO: [duplicate] remove stuff like duplicate
    # TODO: base this on initial options
    def write_html_file(folder = AutoPilot.configuration.folder)
      system 'mkdir', '-p', (folder || DEFAULT_BLOG_FOLDER)
      new_file =  file_name(h1)
      if new_file
        sanitized_file_name = parameterize(new_file)
        File.open("#{folder}/#{sanitized_file_name}.html", 'w') do |file|
          file.write(html_template)
          Log.green "- added file ./#{folder}/#{sanitized_file_name}.html"
        end
      else
        Log.red 'could not create file'
      end
    end
  end
end
