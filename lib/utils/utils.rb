# frozen_string_literal: true

require_relative 'prompts/prompts'
require_relative 'issues'
require_relative 'queries'
require_relative 'reporter'
require_relative 'login'
require 'tty-spinner'

# Some basic utilities
class Util
  def seconds_to_str(seconds)
    ["#{seconds / 3600}h", "#{seconds / 60 % 60}m", "#{seconds % 60}s"]
      .select { |str| str =~ /[1-9]/ }.join(' ')
  end
end