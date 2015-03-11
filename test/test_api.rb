require 'helper'
class TestAPI < MiniTest::Test
  describe 'api' do
    def setup
      configure
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
    it '#get_answers' do
      # assert_equal @subject.answers, []
    end
  end
end
