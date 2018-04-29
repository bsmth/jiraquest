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
    exit if Prompter.new.resume(@user)
    create_user if delete_user?
  end

  def display_user
    puts "Logged in as #{@user}"
  end

  def create_user
    @store.transaction do
      store = @store
      @user = Prompter.new.user
      store.abort unless @user
      store[:user] = @user
    end
    puts "Successfully Logged in as #{@user}"
  end

  def delete_user?
    exit unless @user && Prompter.new.delete(@user)
    @store.transaction do
      store = @store
      store.delete(:user)
    end
  end
end
