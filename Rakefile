task :environment do
  require File.join(File.dirname(__FILE__), %w{config environment})
end

desc 'Start console'
task console: :environment do
  require 'ripl'
  require 'ripl/auto_indent'
  require 'ripl/color_error'
  require 'ripl/irb'
  require 'ripl/multi_line'
  require 'ripl/color_streams'
  require 'ripl/color_result'
  require 'ripl/short_errors'
  ARGV.clear
  Ripl.start binding: binding
  irb
end

task c: :console
