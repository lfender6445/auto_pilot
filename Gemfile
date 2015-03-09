# ruby '1.9.3'
source 'https://rubygems.org'

# Specify your gem's dependencies in theme_bandit.gemspec
gemspec

r_version = RUBY_VERSION.to_f

group :development do
  gem 'rubocop'
  if r_version > 2
    gem 'pry-byebug'
  else
    gem 'pry-debugger'
  end
end

gem 'codeclimate-test-reporter', group: :test, require: nil
gem 'dotenv', '~> 2.0.0'
