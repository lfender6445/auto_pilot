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
      Log.red 'Invalid url'
    end

    attr_reader :url, :options, :document, :error

    def initialize(url, options = {})
      @url, @options = AutoPilot::URLFormatter.default_to_http(url), options
      @document = get_document(url)
    end

    def get_document(url)
      response = self.class.get(url, options)
      log_request(url, response)
      response
    rescue => e
      Log.red "request failed for #{url} #{e}"
      false
    end

    private

    def log_request(url, response)
      if response.code != 200
        @error = response.code
        Log.red "Request failure trying to download #{url}, status #{response.code}"
      else
        Log.green "Downloading #{url}"
      end
    end
  end
end
