require_relative 'helper'
require 'webmock/minitest'
class TestAPI < MiniTest::Test
  describe 'api' do
    def setup
      configure
      AutoPilot.configuration.key = 'some_key'
      @subject = AutoPilot::API.new
      stub_request(:get, /api.stackexchange.com/i).to_return(:status => 200, :body => {}.to_s, :headers => {})
    end

    it '#user' do
      assert_equal @subject.user, 'foo'
    end
    it '#options' do
      assert_equal @subject.options, {}
    end
    it '#answers' do
      assert_equal @subject.answers, []
    end
    it '#throttle' do
      assert_equal @subject.throttle, nil
    end
    it '#pages' do
      assert_equal @subject.pages, [1,2,3]
    end
    it '#get_answers' do
      assert_equal @subject.get_answers, [{:answer_id=>123, :question_id=>123}]
    end
  end
end
