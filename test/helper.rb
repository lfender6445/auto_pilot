ENV['RACK_ENV'] = 'test'

require 'pry'

require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'minitest/autorun'

require_relative '../lib/auto_pilot'

require_relative 'support/common'
# require 'codeclimate-test-reporter'
# CodeClimate::TestReporter.start


def configure
  AutoPilot.configure do |config|
    config.user   = 'foo'
    config.format = [:md, :html]
    config.folder = 'test/stackoverflow'
    config.disable_front_matter = false
    config.max_pages = 3
    config.key = nil
    config.throttle = 3
  end
end

def load_fixture_and_parse
  `rm -rf test/stackoverflow`
  question_id = 28_956_301
  answer_id   = 28_956_353
  doc         = load_html_fixture
  parsed_doc  = AutoPilot::DocumentParser.new(doc, question_id, answer_id)
  [parsed_doc]
end

# squelch log output for tests unless debug set
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

MiniTest.autorun
