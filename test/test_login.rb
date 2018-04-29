# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'

class TestUtils < Test::Unit::TestCase
  def test_login
    assert_nothing_raised do
      Login.new.user_message
      Login.new.current_user
    end
  end
end
