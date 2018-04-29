require_relative 'figlet'
require_relative 'login'

# Simple Console Reporting or usage instructions
class Reporter
  def initialize
    @pastel = Pastel.new
    @prompt = TTY::Prompt.new
    format = "[#{@pastel.yellow(':spinner')}] " + @pastel.yellow('Validating...')
    @spinner = TTY::Spinner.new(format, success_mark: @pastel.green('+'))
  end
  
  def welcome
    Fig.new.roprquest
    puts "\n🤖  Welcome to ROPRQuest, #{Login.new.current_user}!"
  end

  def success(message)
    @spinner.success(@pastel.green(message))
  end

  def validate(message)
    @spinner.auto_spin
    yes = true
    if yes
      # user = Query.new.user
      success("✅  Successfully #{message}\n")
    else
      @spinner.error("❌   Could not #{message}\n\n")
    end
  end
end
