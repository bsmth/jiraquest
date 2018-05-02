# frozen_string_literal: true

require_relative 'figlet'
require_relative '../game/game'

# Simple Console Reporting or usage instructions
class Reporter
  def initialize
    @pastel = Pastel.new
    @prompt = TTY::Prompt.new
    format = "[#{@pastel.yellow(':spinner')}] " + @pastel.yellow('ROPRing...')
    @spinner = TTY::Spinner.new(format, success_mark: @pastel.green('+'))
  end

  def welcome
    Fig.new.roprquest
    success("🤖  Welcome to ROPRQuest, #{Login.new.current_user}!")
  end

  def success(message)
    @spinner.success(@pastel.green(message))
  end

  def timed_success(message, seconds)
    @spinner.auto_spin
    sleep seconds
    success("✅  #{message}\n")
  end

  def quest_complete
    Fig.new.user_message('ROPRd HARD')
    sleep 3
    system 'clear'
    success('Congratulations! You completed a Quest!')
    Score.new.update_quests(1)
    Score.new.report_quests
  end
end
