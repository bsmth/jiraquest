# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative 'suppress_output'

class TestUtils < Test::Unit::TestCase
  def test_figlet
    assert_nothing_raised do
      suppress_output {Fig.new.roprquest}
    end
  end
end
