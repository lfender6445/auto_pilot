require 'bundler/gem_tasks'

namespace :log do
  desc 'Truncates all *.log files in log/ to zero bytes (specify which logs with LOGS=test,development)'
  task :clear do
    log_files.each do |file|
      clear_log_file(file)
    end
  end

  def log_files
    if ENV['LOGS']
      ENV['LOGS'].split(',')
        .map    { |file| "log/#{file.strip}.log" }
        .select { |file| File.exist?(file) }
    else
      FileList['log/*.log']
    end
  end

  def clear_log_file(file)
    f = File.open(file, 'w')
    f.close
  end
end

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/test_*.rb'
  t.verbose = true
end

task default: 'test'
