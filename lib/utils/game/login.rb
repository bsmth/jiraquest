# frozen_string_literal: true

require 'yaml/store'
require_relative '../utils'

# Logs in users
class Login
  def initialize
    @store = DATA
    @user = @store.transaction { @store[:user] }
  end

  # simple method to return the username only for other methods
  def current_user
    @user
  end

  # Report who is logged in
  def user_message
    puts "Logged in as #{@user}"
  end

  # If there a user exists, ask to resume
  def login
    if @user
      resume
    else
      create_user
    end
    Achievement.new.employee_otm
  end

  # Ask to resume, if not, ask to delete user
  def resume
    if Prompter.new.resume(@user)
      user_message
    else
      delete_user?
    end
  end

  def create_user
    @store.transaction do
      store = @store
      @user = Prompter.new.user
      store[:user] = @user
    end
    reset_data
  end

  def reset_data
    Score.new.reset_score
    reset_list(Achievement.new.list, 'achievements')
    reset_list(Activity.new.list, 'distractions')
    reset_list(Activity.new.list, 'warnings')
    reset_list(Notifications.new.list, 'notifications')
    reset_list(Quests.new.list, 'quests')
  end

  def reset_list(data, type)
    @list = Array.new(data.length, {})
    data.each_with_index do |activity, i|
      @list[i][activity] = 0
    end
    @list.uniq!
    @store.transaction do
      store = @store
      store[type] = @list[0]
    end
  end

  # Ask if really sure to delete user
  def delete_user?
    return false unless Prompter.new.delete(@user)
    puts "\n❌ DELETING user #{@user}! This action cannot be undone\n"
    return false unless Prompter.new.really_sure?
    @store.transaction do
      store = @store
      store.delete(:user)
    end
    reset_data
    puts "❌ Deleted user #{@user}"
    create_user
  end
end
