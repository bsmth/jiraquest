require 'tty-prompt'

# Simple User Prompts
class Prompter
  def initialize
    @prompt = TTY::Prompt.new
  end

  def confirm
    exit unless @prompt.yes?('Ready to rock, Y/N?')
    system 'clear'
  end

  def resume(user)
    @prompt.yes?("Would you like to resume ROPRQuest as #{user}?")
  end

  def delete(user)
    @prompt.yes?("Would you like to delete the data for #{user}?")
  end

  def create_user?
    @prompt.yes?("Create a new ROPRQuest user?")
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

  def user
    @prompt.ask('Please type your username:')
  end
end
