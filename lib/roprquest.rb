# frozen_string_literal: true

require_relative 'utils/utils'
require_relative 'roprquest/quests/quests'

DATA = YAML::Store.new(File.expand_path('../assets/data.yml', __dir__))
FIGLET = Figlet::Font.new(File.expand_path('../assets/fonts/big.flf', __dir__))

Login.new.login

# Clear the screen and show a welcome message
system 'clear'
Reporter.new.welcome

Setup.new.quest
