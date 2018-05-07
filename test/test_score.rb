# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'

class TestScore < Test::Unit::TestCase
  def test_basic
    assert_nothing_raised do
      suppress_output do
        Score.new.reset_score
        Score.new.report_score
      end
    end
  end

  def test_add_points
    assert_nothing_raised do
      suppress_output do
        Score.new.reset_score
        Score.new.update_points(20)
        Score.new.update_and_print(20)
      end
    end
  end

  def test_add_quests
    assert_nothing_raised do
      suppress_output do
        Score.new.report_quests
        Score.new.update_quests('SETUP')
        Score.new.update_quests_and_print('SETUP')
      end
    end
  end

  def test_reset_data
    assert_nothing_raised { Score.new.reset_score}
  end
end
