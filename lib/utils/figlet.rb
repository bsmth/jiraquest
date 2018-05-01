# frozen_string_literal: true

require 'figlet'
require 'yaml/store'

# Some ultra cool figlets
class Fig
  def initialize
    @store = YAML::Store.new('data.yml')
    @font = Figlet::Font.new('assets/fonts/big.flf')
    @figlet = Figlet::Typesetter.new(@font)
    @user = @store.transaction { @store[:user] }
  end

  def roprquest
    puts @figlet['ROPRQuest 2018!']
  end

  def user
    puts @figlet[@user.to_s]
  end

  def ropr_user
    puts @figlet["#{@user} ROPRQuest"]
  end
end
