ENV['RACK_ENV'] = 'test'

require 'pry'

require 'rubygems'
require 'minitest/autorun'
require 'webmock/minitest'

require_relative '../lib/auto_pilot'

require_relative 'support/common'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

MiniTest.autorun
