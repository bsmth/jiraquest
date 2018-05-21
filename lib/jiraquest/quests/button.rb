# frozen_string_literal: true

require 'tty-prompt'
require 'utils/utils'

# Workspace setup miniquest
class Button
  def initialize
    @store = DATA
    @prompt = TTY::Prompt.new
    @user = @store.transaction { @store[:user] }
  end

  def quest
    @prompt.warn("\nQuest 2")
    @prompt.ok("'Press The Button'")
    if @user[/[K|k]ristian/]
      button?
      Reporter.new.success('Great!')
    else
      4.times { button? }
      Morale.new.update_and_print(-2)
    end
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
