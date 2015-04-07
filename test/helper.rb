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
        def colorize(*_args); end

        def out(*_args); end
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

# NOTE: stub out answer collection for api tests
module AutoPilot
  class API
    def answer_double
      OpenStruct.new(score: 1,
                     answer_id: 123,
                     question_id: 123)
    end

    def answer_response(*_args)
      # [{:answer_id=>123, :question_id=>123}]
      OpenStruct.new(data: [OpenStruct.new(answers: [answer_double])])
    end
  end
end

require_relative 'support/common'

MiniTest.autorun
