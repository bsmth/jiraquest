require_relative 'roprquest/version'
require_relative 'utils/utils'
require_relative 'quests/quests'

Login.new.login

# Clear the screen and show a welcome message
system 'clear'
Reporter.new.welcome

Setup.new.login
