# frozen_string_literal: true

require 'ruby-progressbar'

# Simple User Prompts
class Notifications
  def initialize
    @store = DATA
    @prompt = TTY::Prompt.new
    @notifications_list = %w[slack reddit text email]
  end

  def list
    @notifications_list
  end

  def slack
    @prompt.ok('Someone sent you a slack message')
  end

  def reddit
    @prompt.ok('Someone replied to a Reddit post of yours')
  end

  def text
    @prompt.ok('Someone sent you a WhatsApp message')
  end

  def email
    @prompt.ok('Someone sent you an email')
  end

  def random
    [slack, reddit, text, email].sample
  end

  def read_notifications_count
    @store.transaction { @store['notifications'] }
  end

  def warning
    dc = read_notifications_count
    limits = dc.select { |_k, v| v > 2 }
    limits.each do |distraction, _count|
      @prompt.error("Be careful, you are spending a lot of time #{distraction}ing, "\
        'you may lose jiras!')
      update_warning(distraction)
    end
    false
  end

  def update_warning(notification)
    @store.transaction { @store['warnings'][notification] += 1 }
  end
end
