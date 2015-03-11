def load_html_fixture
  @fixture ||= File.read(File.open("#{Dir.pwd}/test/fixtures/so_page.html", 'r'))
end

# def load_api_user
#   @fixture ||= File.read(File.open("#{Dir.pwd}/test/fixtures/so_api_user.json", 'r'))
# end
