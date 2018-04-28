require 'bundler/gem_tasks'

task default: :test

task :run do
  ruby 'lib/roprquest.rb'
end

task :rubocop do
  sh 'rubocop'
end

task :test do
  ruby 'test/suite.rb'
end
