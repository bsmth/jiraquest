# frozen_string_literal: true

require 'tty-prompt'

# Workspace setup miniquest
class Button
  def initialize
    @store = DATA
    @prompt = TTY::Prompt.new
  end

  def quest
    @prompt.warn("\nQuest 2")
    @prompt.ok("'Press The Button'")
    5.times { button? }
    sleep 1
    Score.new.update_and_print(1)
    sleep 1
    Reporter.new.quest_complete('Button')
  end

  def button?
    if @prompt.yes?('Have you pressed the button?')
      Reporter.new.timed_success('Connected!', 3)
      true
    else
      Activity.new.choose
    end
  end
end
