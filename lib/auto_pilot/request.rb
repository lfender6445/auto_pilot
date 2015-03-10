require 'httparty'
require_relative 'url_formatter'
require_relative 'util/log'

module AutoPilot
  class Request
    include HTTParty

    def self.fetch(url, options = {})
      error unless url
      new(url, options).document
    end

    def self.error
      Log.red 'invalid url'
    end

    attr_reader :url, :options, :document, :error

    def initialize(url, options = {})
      @url, @options = AutoPilot::URLFormatter.default_to_http(url), options
      @document = get_document(url)
    end

    def get_document(url)
      response = self.class.get(url, options)
      throttle
      log_response(url, response)
      response
    rescue => error
      Log.red "request failed for #{url} #{error}"
      false
    end

    private

    def throttle
      sleep(AutoPilot.configuration.throttle || 3)
    end

    def log_response(url, response)
      code = response.code
      if code != 200
        @error = code
        Log.red "request failure trying to download #{url}, status #{code}"
      else
        Log.green "- downloading #{url}"
      end
    end
  end
end
