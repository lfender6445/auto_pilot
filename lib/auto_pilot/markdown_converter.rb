require 'reverse_markdown'
require_relative 'template_helper'

module AutoPilot
  class MarkdownConverter
    include AutoPilot::TemplateHelper
    attr_reader :doc, :h1, :question, :answer

    DEFAULT_BLOG_FOLDER  =  './stackoverflow'

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
      @markdown ||= <<-BLOCK.unindent
      #{front_matter unless AutoPilot.configuration.disable_front_matter}
      #{h1}
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
      title: "#{h1.strip}"
      description: ""
      category:
      tags: []
      ---
      BLOCK
    end

    def write_md_file(folder = AutoPilot.configuration.folder)
      system 'mkdir', '-p', (folder || DEFAULT_BLOG_FOLDER)
      new_file =  file_name(h1)
      sanitized_file_name = parameterize(new_file)
      File.open("#{folder}/#{sanitized_file_name}.md", 'w') do |file|
        file.write(md_template)
        Log.green "- added file ./#{folder}/#{sanitized_file_name}.md"
      end
    end
  end
end
