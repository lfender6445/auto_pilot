module AutoPilot
  module TemplateHelper
    def file_name(post_title)
      prefix = Time.now.to_s.split(' ').first # TODO: simplify
      suffix = post_title.gsub(' ', '-').downcase.strip
      "#{prefix}-#{suffix}"
    end

    def delimiter
      '--------------------------------------- '
    end

  end
end
