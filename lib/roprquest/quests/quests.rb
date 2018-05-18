# frozen_string_literal: true

require_relative 'setup'
require_relative 'button'

# A class to manage quests
class Quests
  def initialize
    @quests_list = %w[Setup Button]
  end

  def list
    @quests_list
  end
end
