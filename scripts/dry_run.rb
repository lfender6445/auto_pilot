require 'pry'
require 'reverse_markdown'
require_relative '../lib/auto_pilot'

blog_file = 'blog/index.md'
system 'rm', '-f', blog_file

AutoPilot.get_answers.first

f = File.open(blog_file, 'r')
f.each_line do |line|
  puts line
end
f.close
