module AutoPilot
  module TemplateHelper
    # TODO: simplify
    def file_name(post_title)
      prefix = Time.now.to_s.split(' ').first
      suffix = post_title.gsub(' ', '-').downcase.strip
      "#{prefix}-#{suffix}"
    end
  end
end
