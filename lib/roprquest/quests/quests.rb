# frozen_string_literal: true

require_relative 'setup'

class Quests
  def initialize
    @store = DATA
    @quests_list = %w[Setup]
  end

  def list
    @quests_list
  end
end
