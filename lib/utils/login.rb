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

  def login
    unless @user
      create_user 
    else
      resume
    end
  end

  def resume
    if Prompter.new.resume(@user)
      display_user
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

  def delete_user?
    if Prompter.new.delete(@user)
      puts "\n❌ DELETING user #{@user}! This action cannot be undone\n"
      exit unless Prompter.new.really_sure?
      @store.transaction do
        store = @store
        store.delete(:user)
      end
      puts "❌ Deleted user #{@user}"
      create_user
    end
  end

  def display_user
    puts "Logged in as #{@user}"
  end
end
