AutoPilot.configure do |config|
  # string - a stackoverflow username
  config.user = 'username'
  # string - where to put markdown and html files
  config.folder = 'stackoverflow'
  # array - convert to markdown, html, or both eg [:md, :html]
  config.format = [:md, :html]
  # boolean - prevent frontmatter from being added to markdown files
  config.disable_front_matter = false
  # integer - max pages when crawling paginated answers on your user page
  config.max_pages = 50
  # hash - retrieve questions and answers within a date range eg { start: '2000-01-00', end: '2015-03-05' }
  config.date = { start: '2000-01-00', end: Time.now.to_s.split(' ').first }
end
