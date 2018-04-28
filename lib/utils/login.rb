require_relative 'queries'

# Queries, opens and closes issues
class Login
  def login_user
    Prompter.new.user
  end
end
