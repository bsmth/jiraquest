# frozen_string_literal: true

require 'tty-prompt'
require_relative 'setup'
require_relative 'button'

# A class to manage quests
class Quests
  def initialize
    @prompt = TTY::Prompt.new
    @quests_list = %w[Setup Button]
  end

  def list
    @quests_list
  end

  def quest?
    @mode = @prompt.select('What Quest would you like to start?') do |menu|
      menu.choice name: 'Setup Mini-Quest', value: 1
      menu.choice name: 'The Button Challenge', value: 2
    end
    @mode
  end

  def launch_quest
    @quest = case quest?
             when 1 then Setup.new.quest
             when 2 then Button.new.quest
             end
    @quest
  end
end
