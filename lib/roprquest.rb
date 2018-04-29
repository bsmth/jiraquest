# frozen_string_literal: true

require_relative 'roprquest/version'
require_relative 'utils/utils'
require_relative 'config'

Login.new.login

# Clear the screen and show a welcome message
system 'clear'
Reporter.new.welcome
