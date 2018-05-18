# frozen_string_literal: true

require 'yaml/store'
require_relative '../utils'

# Keeps track of users score
class Morale
  def initialize
    @store = DATA
    @morale = @store.transaction { @store[:morale] }
  end

  def report_morale
    puts "Your morale level is #{@morale}"
  end

  def reset_morale
    @store.transaction do
      store = @store
      store[:morale] = 0
    end
  end

  def update_morale(number)
    @store.transaction do
      store = @store
      store[:morale] += number
    end
  end

  def update_and_print(number)
    update_morale(number)
    report_morale
  end
end
