def configure
  AutoPilot.configure do |config|
    config.user   = 'foo'
    config.format = [:md, :html]
    config.folder = 'test/stackoverflow'
    config.disable_front_matter = false
    config.max_pages = 3
    config.key = nil
    config.throttle = 3
  end
end

def load_fixture_and_parse
  `rm -rf test/stackoverflow`
  question_id = 28_956_301
  answer_id   = 28_956_353
  doc         = load_html_fixture
  parsed_doc  = AutoPilot::DocumentParser.new(doc, question_id, answer_id)
  [parsed_doc]
end


def load_html_fixture
  @fixture ||= File.read(File.open("#{Dir.pwd}/test/fixtures/so_page.html", 'r'))
end

# def load_api_user
#   @fixture ||= File.read(File.open("#{Dir.pwd}/test/fixtures/so_api_user.json", 'r'))
# end
