require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    get new_user_path
    assert_difference 'User.count', 1 do
    post new_user_path, params: { session: { 
      								username: "Example",
                                    email: "user@example.com",
                                    password: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end