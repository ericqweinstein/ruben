#!/usr/bin/env rake
# encoding: UTF-8

require 'rspec/core/rake_task'
require 'rubocop/rake_task'

task default: :help

desc 'Display help menu'
task :help do
  puts <<-eos
  Available Rake tasks:

  rake console  # Start IRB with Ruben loaded
  rake help     # Display help menu
  rake rubocop  # Lint
  rake spec     # Run tests
  rake yard     # Generate documentation
  eos
end

desc 'Start IRB with Ruben loaded'
task :console do
  puts 'Loading app environment...'

  require 'irb'
  require 'irb/completion'
  require_relative 'lib/robot'
  ARGV.clear
  IRB.start
end

desc 'Lint'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.patterns = %w(bin/**/* lib/**/*.rb)
end

desc 'Run tests'
task :spec do
  RSpec::Core::RakeTask.new(:spec) do |task|
    task.rspec_opts = ['--color --format d']
    task.pattern    = './spec/**/*_spec.rb'
  end
end

desc 'Build Ruby documentation'
task :yard do
  YARD::Rake::YardocTask.new do |t|
    t.files = ['app.rb, models/*.rb, routes/*.rb']
    t.options = ['--protected', '--private']
  end
end
