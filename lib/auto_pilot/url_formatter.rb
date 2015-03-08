module AutoPilot
  module URLFormatter
    def strip_query_string(str)
      str.split('?').first
    end

    def default_to_http(url)
      url[/(^http:\/\/|^https:\/\/)/] ? url : "http://#{url}"
    end
    module_function :default_to_http

    def path_with_leading_slash(str)
      str[/^\//] ? str : "/#{str}"
    end
  end
end
