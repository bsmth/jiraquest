# frozen_string_literal: true

require 'yaml/store'
require_relative '../utils'
require_relative 'score'

# Keeps track of users score
class Achievement
  def initialize
    @store = YAML::Store.new('data.yml')
    @user = @store.transaction { @store[:user] }
  end

  def employee_otm
    puts 'wow' if @user[/brian/]
  end
end
