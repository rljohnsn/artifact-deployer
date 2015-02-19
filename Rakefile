#!/usr/bin/env rake

require 'foodcritic'
require 'rspec/core/rake_task'

desc "Runs knife cookbook test"
task :knife do
  sh "bundle exec knife cookbook test cookbook -o ./ -a"
end

desc "Runs foodcritic test"
task :foodcritic do
  sh "bundle exec foodcritic -f any ."
end

RSpec::Core::RakeTask.new(:unit) do |t|
  t.pattern = "test/unit/**/*_spec.rb"
end

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end

task :default => [:foodcritic, :knife, :unit]
FoodCritic::Rake::LintTask.new
