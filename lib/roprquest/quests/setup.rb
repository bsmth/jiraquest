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

  def login
    @prompt.ok("\nYour first Quest is 'Set up your Work Environment'
Can you avoid distractions and get your system ready to start collecting ROPRs?\nLet's Begin:\n\n")
    vpn if boot
    workspace
    Reporter.new.quest_complete
  end

  def boot
    System.new.boot
  end

  def vpn
    System.new.vpn
  end

  def ide_update
    System.new.ide_update
  end

  def workspace
    System.new.workspace
  end
end
