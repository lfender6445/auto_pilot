AutoPilot.configure do |config|
  # string or nil - your application key (optional, allows for more requests)
  config.key = nil
  # string - a valid stackoverflow id eg '4727792', can be found on your profile url
  config.user_id = 'userid'
  # integer - score must be greater than threshold in order to qualify for download
  config.score_threshold = -1
  # string - where to put markdown or html files
  config.folder = 'stackoverflow'
  # array - convert to [:md], [:html], or both eg [:md, :html]
  config.format = [:md]
  # boolean - prevent frontmatter from being added to markdown files
  config.disable_front_matter = false
  # integer - max pages when crawling paginated answers on your user page
  config.max_pages = 2
  # integer - time to wait between http requests (optional, eg 3 is 3 seconds)
  config.throttle = 3
end
