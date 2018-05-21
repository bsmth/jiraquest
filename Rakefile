# frozen_string_literal: true

require 'bundler/gem_tasks'

task default: :run

task :run do
  ruby 'lib/jiraquest.rb'
end

task :rubocop do
  sh 'rubocop'
end

task :test do
  ruby 'test/suite.rb'
end
