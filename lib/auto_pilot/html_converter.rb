require_relative 'template_helper'
module AutoPilot
  class HtmlConverter
    include AutoPilot::TemplateHelper
    attr_reader :doc, :h1_tag, :question, :answer

    DEFAULT_BLOG_FOLDER  =  './blog'

    def initialize(doc)
      @h1_tag       = doc.title_html
      @question = doc.question_html
      @answer   = doc.answer_html
      make_folder_if_doesnt_exist
      write_file_to_disk(AutoPilot.configuration.folder, :html)
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
        #{h1_tag}
        #{question}
        #{delimiter}
        #{answer}
      EOS
    end
  end
end
