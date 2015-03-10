
AutoPilot.configure do |config|
  # string - a stackoverflow username
  config.user = 'username'
  # string - where to put markdown and html files
  config.folder = 'stackoverflow'
  # array - convert to [:md], [:html], or both eg [:md, :html]
  config.format = [:md]
  # boolean - prevent frontmatter from being added to markdown files
  config.disable_front_matter = false
  # integer - max pages when crawling paginated answers on your user page
  # config.max_pages = 50
  config.max_pages = 2
  # hash - retrieve questions and answers within a date range eg { start: '2000-01-00', end: '2015-03-05' }
  config.date = { start: '2000-01-00', end: Time.now.to_s.split(' ').first }
  # string or nil - your application key (optional, allows for more requests)
  config.key = nil
  # integer - time to wait between http requests (optional, eg 3 is 3 seconds)
  config.throttle = 3
end
