require_relative 'helper'
require 'webmock/minitest'
class TestAutoPilot < MiniTest::Test
  def setup
    configure
  end

  describe '.page_with_my_answer' do
    it 'returns url' do
      url = ::AutoPilot.page_with_my_answer(123)
      assert_equal url, 'http://stackoverflow.com/questions/123/'
    end
  end

  describe '.write_files' do
    it 'creates html + md files' do
      configure
      parsed_docs = load_fixture_and_parse
      ::AutoPilot.write_files(parsed_docs)
      assert(File.exist? './test/stackoverflow/2015-03-11-refactoring-an-each-loop.md')
      assert(File.exist? './test/stackoverflow/2015-03-11-refactoring-an-each-loop.html')
    end
  end

  describe '.get_api_answers' do
    class AutoPilot::API
      def get_answers
        [{ answer_id: 123, question_id: 123 }]
      end
    end
    before do
      configure
      stub_request(:any, /api.stackexchange.com/i).to_return(status: 200, body: {}.to_s, headers: {})
      stub_request(:any, 'http://stackoverflow.com/questions/123/').to_return(status: 200, body: '', headers: {})
    end
    it 'returns parsed documents' do
      expected = ::AutoPilot.get_api_answers
      assert_kind_of(Array, expected)
      assert_equal(expected[0].answer_id, 123)
      assert_equal(expected[0].question_id, 123)
    end
  end
end
