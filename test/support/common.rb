def load_html_fixture
  @fixture ||= File.read(File.open("#{Dir.pwd}/test/fixtures/so_page.html", 'r'))
end

