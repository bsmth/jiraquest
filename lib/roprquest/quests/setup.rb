# frozen_string_literal: true

require 'yaml/store'
require_relative '../../utils/utils'
require_relative '../distractions/distractions'

# Workspace setup miniquest
class Setup
  def initialize
    @store = YAML::Store.new('data.yml')
    @user = @store.transaction { @store[:user] }
    @prompt = TTY::Prompt.new
  end

  def quest
    @prompt.ok("\nYour first Quest is 'Set up your Work Environment'
Can you avoid distractions and get your system ready to start collecting ROPRs?\nLet's Begin:\n\n")
    System.new.vpn if System.new.boot
    System.new.ide_update
    @prompt.warn('You updated your IDE, but lost work on 1 ROPR.')
    sleep 1
    Score.new.update_and_print(-1)
    sleep 1
    Reporter.new.quest_complete
  end
end
