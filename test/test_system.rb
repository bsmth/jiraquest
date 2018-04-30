# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative 'suppress_output'

class TestSystem < Test::Unit::TestCase
  def test_system
    assert_nothing_raised do
      suppress_output { System.new.updating }
    end
  end
end
