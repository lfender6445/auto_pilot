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
    assert(File.exists? './test/stackoverflow/2015-03-10-refactoring-an-each-loop.md')
    assert(File.exists? './test/stackoverflow/2015-03-10-refactoring-an-each-loop.html')
  end
end

