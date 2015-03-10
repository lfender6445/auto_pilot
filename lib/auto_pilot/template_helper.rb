module AutoPilot
  module TemplateHelper
    def file_name(post_title)
      prefix = Time.now.to_s.split(' ').first # TODO: simplify
      suffix = post_title.gsub(' ', '-').downcase.strip
      "#{prefix}-#{suffix}"
    end

    # def sanitize_file_name(file_name)
    #   fn = file_name.split(/(?<=.)\.(?=[^.])(?!.*\.[^.])/m)
    #   fn.map! { |s| s.gsub(/[^a-z0-9\-]+/i, '-') }
    #   fn.join '.'
    # end

    def parameterize(string, sep = '-')
      # replace accented chars with their ascii equivalents
      # parameterized_string = transliterate(string)
      # Turn unwanted chars into the separator
      string.gsub!(/[^a-z0-9\-_]+/i, sep)
      unless sep.nil? || sep.empty?
        re_sep = Regexp.escape(sep)
        # No more than one of the separator in a row.
        string.gsub!(/#{re_sep}{2,}/, sep)
        # Remove leading/trailing separator.
        string.gsub!(/^#{re_sep}|#{re_sep}$/i, '')
      end
      string.downcase
    end
  end
end
