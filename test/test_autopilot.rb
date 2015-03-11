require_relative 'helper'
class TestAutoPilot < MiniTest::Test
  def setup
    configure
    @subject = AutoPilot
  end

  def test_page_with_my_answer
    url = @subject.page_with_my_answer(123)
    assert_equal url, 'http://stackoverflow.com/questions/123/'
  end

  def test_write_files
    parsed_docs = load_fixture_and_parse
    @subject.write_files(parsed_docs)
    assert(File.exist? './test/stackoverflow/2015-03-10-refactoring-an-each-loop.md')
    assert(File.exist? './test/stackoverflow/2015-03-10-refactoring-an-each-loop.html')
  end

  describe '#get_answers' do
    class AutoPilot::API
      def get_answers; [{answer_id: 123, question_id: 123}]; end
    end
    def setup
      configure
      stub_request(:get, /api.stackexchange.com/i).to_return(:status => 200, :body => {}.to_s, :headers => {})
      stub_request(:get, "http://stackoverflow.com/questions/123/").
        to_return(:status => 200, :body => "", :headers => {})
    end
    it 'returns parsed documents' do
      @subject = AutoPilot
      assert_kind_of(Array, @subject.get_api_answers)
      assert_equal(@subject.get_api_answers[0].answer_id, 123)
      assert_equal(@subject.get_api_answers[0].question_id, 123)
    end
  end
end
