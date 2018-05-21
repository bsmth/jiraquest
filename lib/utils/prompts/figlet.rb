# frozen_string_literal: true

require 'figlet'
require 'yaml/store'

# Some ultra cool figlets
class Fig
  def initialize
    @store = DATA
    @font = FIGLET
    @figlet = Figlet::Typesetter.new(@font)
    @user = @store.transaction { @store[:user] }
  end

  def jiraquest
    puts @figlet['jiraquest 2018!']
  end

  def user
    puts @figlet[@user.to_s]
  end

  def jira_user
    puts @figlet["#{@user} jiraquest"]
  end

  def user_message(message)
    puts @figlet["#{@user} #{message}"]
  end
end
