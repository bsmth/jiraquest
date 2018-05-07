# frozen_string_literal: true

require 'yaml/store'
require_relative '../../utils/utils'

# Workspace setup miniquest
class Activity
  def initialize
    @store = YAML::Store.new('data.yml')
    @prompt = TTY::Prompt.new
    @distractions_list = %w[water coffee walk text think complain chat tune]
  end

  def list
    @distractions_list
  end

  def read_distractions_count
    @store.transaction { @store['distractions'] }
  end

  def read_warnings_count
    @store.transaction { @store['warnings'] }
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

  def tune
    dc = read_distractions_count
    music = dc.select { |k, _v| k == 'tune' }
    played = music['tune']
    if played.even?
      play_tune('why', 'does your love', 'hurt so much')
    else
      play_tune('words', 'don\'t come easy', 'to me')
    end
    update_distraction('tune')
  end

  def play_tune(*lines)
    lines.each do |line|
      puts "🎶 #{line} 🎶"
      sleep(1)
    end
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
      menu.choice name: 'Play some tunes', value: 8
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
                   when 8 then tune
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

  def warning_count(distraction)
    @store['warnings'][distraction]
  end

  def update_warning(distraction)
    @store.transaction { @store['warnings'][distraction] += 1 }
  end

  def warning
    if coffee_armageddon
      complain
    else
      distract_warning('already, you may lose a ROPR!')
    end
  end

  def boot_warning
    distract_warning('without even turning on your machine!')
  end

  def distract_warning(message)
    dc = read_distractions_count
    limits = dc.select { |_k, v| v > 4 }
    limits.each do |distraction, count|
      @prompt.error("Be careful, you have had #{count} #{distraction}s " + message)
      update_warning(distraction)
    end
  end

  def coffee_armageddon
    dc = read_warnings_count
    limits = dc.select { |_k, v| v > 1 }
    limits.each do |distraction, _count|
      @prompt.error('You were warned! You now lose TEN ROPRs!')
      update_warning(distraction)
      Score.new.update_points(-10)
    end
    true
  end
end
