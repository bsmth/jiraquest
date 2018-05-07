# frozen_string_literal: true

require 'test/unit'
require_relative '../lib/utils/utils.rb'
require_relative '../lib/roprquest/quests/quests'
require_relative '../lib/roprquest/distractions/distractions'

class TestNotifications < Test::Unit::TestCase
  def test_ok_prompts
    suppress_output do 
      Notifications.new.list
      Notifications.new.slack
      Notifications.new.reddit
      Notifications.new.text
      Notifications.new.email  
    end
  end

  def test_read_notification_count
    suppress_output do 
      Notifications.new.read_notifications_count  
    end
  end

  def test_warning
    suppress_output do
      Login.new.reset_data
      Notifications.new.warning  
    end
  end

  def test_random
    suppress_output do 
      Notifications.new.random  
    end
  end
end
