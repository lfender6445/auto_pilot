module AutoPilot
  module TemplateHelper
    def file_name(post_title)
      prefix = Time.now.to_s.split(' ').first # TODO: simplify
      suffix = post_title.gsub(' ', '-').downcase.strip
      "#{prefix}-#{suffix}"
    end

    # def sanitize_file_name(file_name)
    #  file_name.strip.gsub(/[^0-9A-Za-z.\-]|\//, '-')
    # end

    def sanitize_file_name(file_name)
      # Split the name when finding a period which is preceded by some
      # character, and is followed by some character other than a period,
      # if there is no following period that is followed by something
      # other than a period (yeah, confusing, I know)
      fn = file_name.split(/(?<=.)\.(?=[^.])(?!.*\.[^.])/m)

      # We now have one or two parts (depending on whether we could find
      # a suitable period). For each of these parts, replace any unwanted
      # sequence of characters with an underscore
      fn.map! { |s| s.gsub(/([^a-z0-9\-]+|\-\-)/i, '-') }

      # Finally, join the parts with a period and return the result
      fn.join '.'
    end
  end
end
