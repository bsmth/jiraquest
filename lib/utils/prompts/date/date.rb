# frozen_string_literal: true

require 'tty-prompt'

# Simple User Prompts
class Prompter
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
end
