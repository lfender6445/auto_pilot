module AutoPilot
  module TemplateHelper
    def file_name(post_title)
      prefix = Time.now.to_s.split(' ').first # TODO: simplify
      suffix = post_title.gsub(' ', '-').downcase.strip
      "#{prefix}-#{suffix}"
    end

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

    def make_folder_if_doesnt_exist
      system 'mkdir', '-p', AutoPilot.confiugration.folder
    end

    def write_file_to_disk(folder = AutoPilot.configuration.folder, type)
      new_file =  file_name(h1_tag)
      sanitized_file_name = parameterize(new_file)
      File.open("#{folder}/#{sanitized_file_name}.#{type}", 'w') do |file|
        method = "#{type}_template"
        file.write(send(method))
        Log.green "- added file ./#{folder}/#{sanitized_file_name}.#{type}"
      end
    end
  end
end
