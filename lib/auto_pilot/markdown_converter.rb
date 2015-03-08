require 'reverse_markdown'
require_relative 'template_helper'

module AutoPilot
  class MarkdownConverter
    include AutoPilot::TemplateHelper
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
      @markdown ||= <<-BLOCK.unindent
      #{front_matter}
      #{h1}
      #{question}
      #{answer}
      BLOCK
    end

    # TODO: this should also be optional but default to true
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

    def write_md_file(folder = DEFAULT_BLOG_FOLDER)
      system 'mkdir', '-p', folder
      new_file =  file_name(h1)
      File.open("#{folder}/#{new_file}.md", 'w') { |file| file.write(md_template) }
    end
  end
end
