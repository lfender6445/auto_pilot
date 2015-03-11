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

MiniTest.autorun

def configure
  AutoPilot.configure do |config|
    config.user   = 'foo'
    config.format = [:md, :html]
    config.folder = "test/stackoverflow"
    config.disable_front_matter = false
    config.max_pages = 3
    config.key = nil
    config.throttle = 3
  end
end

def load_fixture_and_parse
  `rm -rf test/stackoverflow`
  question_id = 28956301
  answer_id   = 28956353
  doc         = load_html_fixture
  parsed_doc  = AutoPilot::DocumentParser.new(doc, question_id, answer_id)
  [parsed_doc]
end

