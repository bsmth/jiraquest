# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative 'suppress_output'

class TestReporter < Test::Unit::TestCase
  def test_Activites
    assert_nothing_raised do
      suppress_output do
        Activity.new.coffee
        Activity.new.chat
        Activity.new.text
        Activity.new.water
        Activity.new.complain
        Activity.new.walk
        Activity.new.think
      end
    end
  end
end
