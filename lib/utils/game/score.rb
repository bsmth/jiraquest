# frozen_string_literal: true

require 'yaml/store'
require_relative '../utils'

# Keeps track of users score
class Score
  def initialize
    @store = DATA
    @score = @store.transaction { @store[:score] }
  end

  # ROPRS ==========================
  def report_score
    puts "You have #{@score} ROPRs"
  end

  def reset_score
    @store.transaction do
      store = @store
      store[:score] = 0
    end
  end

  def update_points(number)
    @store.transaction do
      store = @store
      store[:score] += number
    end
  end

  def update_and_print(number)
    update_points(number)
    report_score
  end

  # QUESTS ==========================
  def report_quests
    puts "You have completed #{@quests} Quests"
  end

  def update_quests(quest)
    @store.transaction do
      store = @store
      store['quests'][quest.to_s] = 'DONE'
    end
  end

  def update_quests_and_print(number)
    update_quests(number)
    report_quests
  end
end
