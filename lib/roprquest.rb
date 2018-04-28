require_relative 'roprquest/version'
require_relative 'utils/util'
require_relative 'config'

# Run through the setup checklist before proceeding
Prompter.new.confirm

# Clear the screen and show a welcome message
system 'clear'
Reporter.new.welcome

# Prompt the user to select which mode to run Orgbots in
Config.new.mode_config
