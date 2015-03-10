require_relative 'helper'
class TestAutoPilot < MiniTest::Test
  def setup

   `rm -rf test_stackoverflow`
    @subject = AutoPilot
    @subject.configure do |config|
      config.user   = 'lfender6445'
      config.format = [:md, :html]
      config.folder = "test/stackoverflow"
      config.disable_front_matter = false
      config.max_pages = 2
    end

  end

  def test_page_with_my_answer
    url = @subject.page_with_my_answer(123)
    assert_equal url, 'http://stackoverflow.com/questions/123/'
  end

  def test_write_files
    question_id = 28956301
    answer_id   = 28956353
    doc = load_html_fixture
    parsed_doc = AutoPilot::DocumentParser.new(doc, question_id, answer_id)
    parsed_docs = [parsed_doc]
    @subject.write_files(parsed_docs)
    assert(File.exists? './test/stackoverflow/2015-03-10-refactoring-an-each-loop.md')
  end
end

