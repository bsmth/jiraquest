# frozen_string_literal: true

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

  def user
    @prompt.ask('Please enter your username:')
  end

  def create_user?
    @prompt.yes?('Create a new ROPRQuest user?')
  end

  def resume(user)
    @prompt.yes?("Would you like to resume ROPRQuest as #{user}?")
  end

  def delete(user)
    @prompt.yes?("Would you like to delete the data for #{user}?")
  end
end
