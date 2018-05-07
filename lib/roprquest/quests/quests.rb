# frozen_string_literal: true

require_relative 'setup'

class Quests
  def initialize
    @store = YAML::Store.new('data.yml')
    @quests_list = %w[Setup]
  end

  def list
    @quests_list
  end
end
