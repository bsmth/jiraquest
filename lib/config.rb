require_relative 'utils/util'
require 'tty-prompt'
require 'tty-spinner'
require 'pastel'

# Initialization config for setting up scheduling
# this requires user input vua tty-prompt gem
class Config
  def initialize
    @pastel = Pastel.new
    @prompt = TTY::Prompt.new
    format = "[#{@pastel.yellow(':spinner')}] " + @pastel.yellow('Validating...')
    @spinner = TTY::Spinner.new(format, success_mark: @pastel.green('+'))
  end

  def success(message)
    @spinner.success(@pastel.green(message))
  end

  def validate(message)
    @spinner.auto_spin
    # progress
    # choose
    if success
      user = Query.new.user
      success("✅  Successfully #{message}\n")
    else
      @spinner.error("❌   Could not #{message}\n\n")
    end
  end
end
