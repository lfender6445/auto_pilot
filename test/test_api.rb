require 'helper'
class TestAPI < MiniTest::Test
  describe 'api' do
    def setup
      configure
      @subject = AutoPilot::API.new
      stub_request(:get, /api.stackexchange.com/i).to_return(:status => 200, :body => {}.to_s, :headers => {})
    end

    def answer_api_stub
      @subject = Class.new do
        def question_id
          123
        end
        def answer_id
          123
        end
        def score
          0
        end
      end
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
    it '#get_answers' do
      @subject = AutoPilot::API.new do
        def answers
          answer_api_stub
        end
      end
      stub_request(:any, /api.stackexchange.com/i).to_return(:status => 200, :body => {}.to_s, :headers => {})
      assert_equal @subject.answers, []
    end
  end
end
