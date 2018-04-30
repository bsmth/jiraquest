# frozen_string_literal: true

require_relative '../../../distractions/activities'
require 'tty-prompt'
require 'timeout'

# Simple User Prompts
class System
  def initialize
    @prompt = TTY::Prompt.new
  end

  def boot
    if @prompt.yes?('Would you like to boot up your work machine?')
      puts 'booting'
      true
    else
      Activity.new.choose
      boot
    end
  end

  def vpn
    Timeout.timeout(1) do
      @prompt.ask('Please enter your VPNs 2FA PIN:')
    end
    # progress
  rescue Timeout::Error
    @prompt.warn('The 2FA timed out, TYPE FASTER')
    vpn
  end

  def vpn_expired
    @prompt.error('Your VPN session has expired!')
    @prompt.ask('Please enter your 2FA VPN PIN:')
    puts 'connecting'
    # progress
  end

  def ide_update
    @prompt.warn('There is an IDE update')
    @mode = @prompt.select('what would you like to do') do |menu|
      menu.default 1
      menu.choice name: 'Update now', value: 1
      menu.choice name: 'Don\'t update', value: 2
    end
    @mode
  end

  def workspace
    @result = case ide_update
              when 1 then updating
              when 2 then vpn
              end
    # @input_date = ask_date
    @result
  end

  def updating
    puts 'Updating IDE'
    # progress
  end
end
