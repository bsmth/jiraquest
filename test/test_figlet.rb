# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils'
require_relative 'suppress_output'

class TestFiglet < Test::Unit::TestCase
  def test_jiraquest
    assert_nothing_raised do
      suppress_output { Fig.new.jiraquest }
    end
  end

  def test_user
    assert_nothing_raised do
      suppress_output { Fig.new.user }
    end
  end

  def test_jira_user
    assert_nothing_raised do
      suppress_output { Fig.new.jira_user }
    end
  end

  def test_user_with_message
    assert_nothing_raised do
      suppress_output { Fig.new.user_message('Hello from test suite') }
    end
  end
end
