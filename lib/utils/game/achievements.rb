# frozen_string_literal: true

require 'yaml/store'
require_relative '../utils'
require_relative 'score'

# Keeps track of users achievements
class Achievement
  def initialize
    @pastel = Pastel.new
    @store = DATA
    @user = @store.transaction { @store[:user] }
    @chieve_list = %w[employee_otm]
    @spinner = TTY::Spinner.new('[:spinner] :title', success_mark: @pastel.green('+'))
  end

  def list
    @chieve_list
  end

  def increment_chieve(chieve)
    puts '🏆 Achievement Unlocked! 🎊'
    @store.transaction { @store['achievements'][chieve] += 1 }
  end

  def employee_otm
    if @user[/[K|k]ristian/]
      @spinner.auto_spin
      @spinner.update(title: 'Evaluating ROPR Performance')
      sleep 5
      @spinner.update(title: 'Calculated Value Added to Company:')
      @spinner.success(@pastel.green("\n👨🏻‍💼 Kristian has earned: Employee Of The Month\n"))
      increment_chieve('employee_otm')
      sleep 5
    end
  end
end
