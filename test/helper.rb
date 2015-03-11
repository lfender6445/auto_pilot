ENV['RACK_ENV'] = 'test'

require 'pry'

require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'minitest/autorun'

require_relative '../lib/auto_pilot'

# require 'codeclimate-test-reporter'
# CodeClimate::TestReporter.start

# NOTE: squelch log output for tests unless debug set
unless ENV['DEBUG']
  module AutoPilot
    class Log
      class << self
        def colorize(*args); end
        def out(*args); end
      end
    end
  end
end
# NOTE: set fixed date for file writes
module AutoPilot
  module TemplateHelper
    def file_name(post_title)
      prefix = '2015-03-11'
      suffix = post_title.gsub(' ', '-').downcase.strip
      "#{prefix}-#{suffix}"
    end
  end
end
require_relative 'support/common'

MiniTest.autorun
