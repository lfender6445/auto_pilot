source 'https://rubygems.org'

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

gem 'ruby-stackoverflow', path: '/Users/lfender/source/ruby-stackoverflow'
gem 'codeclimate-test-reporter', group: :test, require: nil
gem 'dotenv', '~> 2.0.0'
