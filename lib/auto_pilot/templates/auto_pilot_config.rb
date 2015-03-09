AutoPilot.configure do |config|
  # a stackoverflow username
  config.user = 'username'
  # convert to markdown, html, or both
  config.format = [:md, :html]
  # where to put markdown and html files
  config.folder = 'stackoverflow'
  # prevent frontmatter from being added to markdown files
  config.disable_front_matter = false
end
