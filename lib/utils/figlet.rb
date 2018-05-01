# frozen_string_literal: true

require 'figlet'

# Some ultra cool figlets
class Fig
  def initialize
    @font = Figlet::Font.new('assets/fonts/big.flf')
    @figlet = Figlet::Typesetter.new(@font)
  end

  def roprquest
    puts @figlet['ROPRQuest 2018!']
  end
end
