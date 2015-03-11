require_relative 'helper'
require 'webmock/minitest'
class TestRequest < MiniTest::Test
  describe '.fetch' do
    describe 'success' do
      before do
        configure
        stub_request(:get, 'http://www.example.com/')
          .to_return(status: 200, body: load_html_fixture, headers: {})
        @subject = AutoPilot::Request
      end

      def test_fetch
        response = @subject.fetch('http://www.example.com')
        refute_empty response
        assert_equal HTTParty::Response, response.class
      end
    end
    describe 'invalid' do
      before do
        configure
        stub_request(:get, 'http://www.example.com/')
          .to_return(status: 404, body: load_html_fixture, headers: {})
        @subject = AutoPilot::Request
      end

      def test_fetch
        response = @subject.fetch('http://www.example.com')
        refute_empty response
        assert_equal HTTParty::Response, response.class
      end
    end
  end
end
