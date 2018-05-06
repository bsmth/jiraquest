# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative 'suppress_output'

class TestTerminal < Test::Unit::TestCase
  def test_r_progress
    assert_nothing_raised do
      suppress_output { Terminal.new.r_progress(10) }
    end
  end

  def test_progress
    assert_nothing_raised do
      suppress_output { Terminal.new.progress }
    end
  end
end
