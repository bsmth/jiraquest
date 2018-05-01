# frozen_string_literal: true

require_relative 'figlet'
require_relative 'game/login'

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

  def validate(message)
    @spinner.auto_spin
    yes = true
    if yes
      # user = Query.new.user
      success("✅  #{message}\n")
    else
      @spinner.error("❌  #{message}\n\n")
    end
  end

  def quest_complete
    system 'clear'
    Fig.new.ropr_user
    success('Congratulations! You completed a Quest!')
    Score.new.update_quests(1)
    Score.new.report_quests
  end
end
