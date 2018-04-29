require_relative 'roprquest/version'
require_relative 'utils/utils'

Login.new.login

# Clear the screen and show a welcome message
system 'clear'
Reporter.new.welcome
