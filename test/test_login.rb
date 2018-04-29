# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative 'suppress_output'

class TestUtils < Test::Unit::TestCase
  def test_login
    assert_nothing_raised do
      suppress_output { Login.new.user_message }
      suppress_output { Login.new.current_user }
    end
  end
end
