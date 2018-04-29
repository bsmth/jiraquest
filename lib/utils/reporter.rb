require_relative 'figlet'
require_relative 'login'
require_relative '../config'

# Simple Console Reporting or usage instructions
class Reporter
  def welcome
    Fig.new.roprquest
    puts "\n🤖  Welcome to ROPRQuest, #{Login.new.current_user}!"
  end
end
