require 'yaml/store'
require_relative '../utils/utils'
require_relative '../distractions/distractions'

# Workspace setup miniquest
class Setup
  def initialize
    @store = YAML::Store.new('data.yml')
    @user = @store.transaction { @store[:user] }
  end

  def login
    puts "Your first Quest is 'Log In'"
    vpn if boot
    ide_update
  end

  def boot
    System.new.boot
    # progress bar
  end

  def vpn
    System.new.vpn
  end

  def ide_update
    System.new.ide_update
  end
end
