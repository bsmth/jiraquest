# frozen_string_literal: true

require_relative 'setup'

# A class to manage quests
class Quests
  def initialize
    @store = DATA
    @quests_list = %w[Setup]
  end

  def list
    @quests_list
  end
end
