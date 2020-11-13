task :environment do
  require File.join(File.dirname(__FILE__), %w{config environment})
end

desc 'Start console'
task console: :environment do
  ARGV.clear
  binding.irb
end

task c: :console
