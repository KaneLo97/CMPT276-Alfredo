require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def log_in_as(user, password: 'password')
    post login_path, params: { session: { username: user.username, password: password}}
  end
  
  # Add more helper methods to be used by all tests here...
end
