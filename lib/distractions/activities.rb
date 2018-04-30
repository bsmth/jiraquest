require 'yaml/store'
require_relative '../utils/utils'

# Workspace setup miniquest
class Activity
  def initialize
    @store = YAML::Store.new('data.yml')
    @prompt = TTY::Prompt.new
    @distractions = %w[water coffee walk text think complain chat]
  end

  def list_distractions
    @distractions
  end

  def coffee
    puts 'You made a coffee'
    update_distraction('coffee')
  end

  def chat
    puts 'You chatted with your colleagues'
    update_distraction('chat')
  end

  def text
    puts 'You sent a text to your significant other'
    update_distraction('text')
  end

  def water
    puts 'You drank some cucumber water'
    update_distraction('water')
  end

  def complain
    puts 'You complained loudly'
    update_distraction('complain')
  end

  def walk
    puts 'You take a walk outside'
    update_distraction('walk')
  end

  def think
    puts 'You thought about things'
    update_distraction('think')
  end

  # rubocop:disable Metrics/MethodLength
  def activities
    @mode = @prompt.select('Do something else') do |menu|
      menu.default 1
      menu.choice name: 'Make coffee', value: 1
      menu.choice name: 'Have a chat', value: 2
      menu.choice name: 'Send a text', value: 3
      menu.choice name: 'Drink some water', value: 4
      menu.choice name: 'Complain', value: 5
      menu.choice name: 'Go for a walk', value: 6
      menu.choice name: 'Think', value: 7
    end
    @mode
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/CyclomaticComplexity
  def choose
    @distraction = case activities
                   when 1 then coffee
                   when 2 then chat
                   when 3 then text
                   when 4 then water
                   when 5 then complain
                   when 6 then walk
                   when 7 then think
                   end

    @distraction
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def update_distraction(distraction)
    @store.transaction { @store['distractions'][distraction] += 1 }
  end

  def distract_count(distraction)
    @store['distractions'][distraction]
  end
end
