# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative '../lib/jiraquest/distractions/distractions'
require_relative 'suppress_output'

class TestReporter < Test::Unit::TestCase
  def test_read_warnings
    assert_nothing_raised { Activity.new.read_warnings_count }
  end
  def test_distract_count
    assert_nothing_raised do
      Login.new.reset_data
      4.times do
        Activity.new.update_warning('water')
      end
    end
  end

  def test_update_warning
    assert_nothing_raised do
      Login.new.reset_data
      dist = Activity.new.list.first
      Activity.new.update_warning(dist)
    end
  end

  def test_update_distraction
    assert_nothing_raised do
      Login.new.reset_data
      dist = Activity.new.list.first
      Activity.new.update_distraction(dist)
    end
  end

  def test_armageddon
    assert_nothing_raised do
      Activity.new.coffee_armageddon
    end
  end

  def test_boot_warning
    assert_nothing_raised do
      Activity.new.boot_warning
    end
  end

  def test_all_activites
    assert_nothing_raised do
      suppress_output do
        Login.new.reset_data
        Activity.new.coffee
        Activity.new.chat
        Activity.new.text
        Activity.new.water
        Activity.new.complain
        Activity.new.walk
        Activity.new.think
        2.times {Activity.new.tune}
        Login.new.reset_data
      end
    end
  end   
end
