require_relative 'queries'
require_relative '../config'

# Simple Console Reporting or usage instructions
class Reporter
  def initialize
  end

  def welcome
    c = "User"
    puts c.say("Sup #{Query.new.user}")
    puts "\n🤖  Welcome to ROPRQuest!"\
         'Ready to get started?'
  end
end
