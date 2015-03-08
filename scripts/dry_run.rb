require 'pry'
require 'reverse_markdown'
require_relative '../lib/auto_pilot'

blog_file = 'blog/index.md'
system 'rm', '-f', '*'

AutoPilot.get_answers.first
blog_file = `ls blog`.strip
f = File.open("blog/#{blog_file}", 'r')
f.each_line do |line|
  puts line
end
f.close
