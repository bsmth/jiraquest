# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative 'suppress_output'

class TestReporter < Test::Unit::TestCase
  def test_welcome
    assert_nothing_raised do
      suppress_output { Reporter.new.welcome }
    end
  end

  def test_success
    assert_nothing_raised do
      suppress_output { Reporter.new.success('cool') }
    end
  end


  def test_t_success
    assert_nothing_raised do
      suppress_output { Reporter.new.timed_success('Coool message', 1) }
    end
  end

  def test_quest_complete
    assert_nothing_raised do
      suppress_output { Reporter.new.quest_complete('Test') }
    end
  end
end
