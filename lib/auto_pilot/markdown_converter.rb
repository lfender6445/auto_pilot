require 'reverse_markdown'
require_relative 'template_helper'

module AutoPilot
  class MarkdownConverter
    include AutoPilot::TemplateHelper
    attr_reader :doc, :h1, :question, :answer

    DEFAULT_BLOG_FOLDER  =  './stackoverflow'

    def initialize(doc)
      @h1_tag   = to_markdown doc.title_html
      @question = to_markdown doc.question_html
      @answer   = to_markdown doc.answer_html
      make_folder_if_doesnt_exist
      write_file_to_disk(AutoPilot.configuration.folder, :md)
    end

    private

    def to_markdown(html)
      ReverseMarkdown.convert html
    end

    def md_template
      @markdown ||= <<-BLOCK.unindent
      #{front_matter unless AutoPilot.configuration.disable_front_matter}
      #{h1_tag}
      #{question}
      #{delimiter}
      #{answer}
      BLOCK
    end

    def delimiter
      '--------------------------------------- '
    end

    def front_matter
      <<-BLOCK.unindent
      ---
      layout: post
      title: "#{h1_tag.strip}"
      description: ""
      category:
      tags: []
      ---
      BLOCK
    end
  end
end
