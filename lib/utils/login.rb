require "yaml/store"
require_relative 'queries'
require_relative 'prompter'

# Logs in users
class Login
  def initialize
    @store = YAML::Store.new("data.yml")
    @user = @store.transaction { @store[:user] }
  end

  def login
    if @user
      if Prompter.new.resume(@user)
        puts "Welcome back #{@user}"
      else 
        if delete_user?
          puts "Deleted #{@user}"
          create_user
        end
      end
    else 
      create_user
    end 
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
  
    puts "Successfully Logged in #{@user}"
  end

  def delete_user?
    # check if user exists
    if @user
      # ask if deleting should be done
      if Prompter.new.delete(@user)
        @store.transaction do
          store = @store
          store.delete(:user)
        end
      end

    end
  end
end
