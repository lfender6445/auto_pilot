module AutoPilot
  module URLFormatter
    def default_to_http(url)
      url[/(^http:\/\/|^https:\/\/)/] ? url : "http://#{url}"
    end
    module_function :default_to_http
  end
end
