# frozen_string_literal: true

require_relative 'terminal'
require_relative '../../jiraquest/distractions/activities'
require 'tty-prompt'
require 'ruby-progressbar'
require 'timeout'

# Simple User Prompts
class System
  def initialize
    @prompt = TTY::Prompt.new
  end

  def vpn
    Terminal.new.two_factor
    Terminal.new.r_progress(100)
    Reporter.new.success('Jacked into the network.')
  end

  def boot
    Activity.new.boot_warning
    if @prompt.yes?('Would you like to boot up your work machine?')
      Reporter.new.timed_success('Booted Up!', 3)
      true
    else
      Activity.new.choose
      boot
    end
  end

  def stress_vpn
    Timeout.timeout(1) do
      vpn
    end
  rescue Timeout::Error
    @prompt.warn('The 2FA timed out, TYPE FASTER')
    vpn
  end

  def vpn_expired
    @prompt.error("\nYou return to your machine to find your VPN session has expired!")
    Terminal.new.two_factor
    Terminal.new.r_progress(100)
  end

  def ide_update
    @prompt.warn("\nThere is an IDE update")
    ide_distractions until @prompt.yes?('Do you update your IDE now?')
    updating
  end

  def ide_distractions
    Activity.new.choose
    Activity.new.warning
    vpn_expired
    Notifications.new.reddit
    Notifications.new.warning
  end

  def updating
    puts 'Updating IDE'
    Terminal.new.amazing_update
  end
end
