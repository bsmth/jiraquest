# frozen_string_literal: true

require 'tty-prompt'
require 'tty-spinner'

class Dateutil
  def initialize
    @prompt = TTY::Prompt.new
  end

  def ask_date
    Time.parse(@prompt.ask('Enter a date (Y/M/D):'))
  end

  def ask_start_date
    Time.parse(@prompt.ask('Enter a start date (Y/M/D):'))
  end

  def ask_end_date
    Time.parse(@prompt.ask('Enter an end date (Y/M/D):'))
  end

  def seconds_to_str(seconds)
    ["#{seconds / 3600}h", "#{seconds / 60 % 60}m", "#{seconds % 60}s"]
      .select { |str| str =~ /[1-9]/ }.join(' ')
  end
end
