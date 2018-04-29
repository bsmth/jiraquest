# frozen_string_literal: true

require_relative 'roprquest/version'
require_relative 'utils/utils'
require_relative 'config'
require 'yaml/store'

Login.new.login
# store = PStore.new()

# # Run through the setup checklist before proceeding
# # Clear the screen and show a welcome message
# system 'clear'
# Reporter.new.welcome
# Login.new.login_user

# # Prompt the user to select which mode to run Orgbots in
# Config.new.validate('Login')
# Prompter.new.confirm
