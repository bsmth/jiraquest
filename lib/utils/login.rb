# frozen_string_literal: true

require 'yaml/store'
require_relative 'queries'
require_relative 'utils'

# Logs in users
class Login
  def initialize
    @store = YAML::Store.new('data.yml')
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
    puts "Successfully Logged in as #{@user}"
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
    puts "❌ Deleted user #{@user}"
    create_user
  end
end
