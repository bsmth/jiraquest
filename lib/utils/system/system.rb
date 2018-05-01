# frozen_string_literal: true

require_relative 'terminal'
require_relative '../../roprquest/distractions/activities'
require 'tty-prompt'
require 'ruby-progressbar'
require 'timeout'

# Simple User Prompts
class System
  def initialize
    @prompt = TTY::Prompt.new
    form = "\e[0;34m%t: |%B|\e[0m"
  end

  def vpn
    Terminal.new.two_factor
    Terminal.new.r_progress(100)
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

  def stress_vpn
    Timeout.timeout(1) do
      vpn
    end
  rescue Timeout::Error
    @prompt.warn('The 2FA timed out, TYPE FASTER')
    vpn
  end

  def vpn_expired
    @prompt.error('Your VPN session has expired!')
    Terminal.new.two_factor
    Terminal.new.r_progress(100)
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
              when 2 then distract
              end
    @result
  end

  def distract
    Activity.new.choose
    vpn_expired
  end

  def updating
    puts 'Updating IDE'
    Terminal.new.amazing_update
  end
end
