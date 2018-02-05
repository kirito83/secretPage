require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "valid signup information" do
    get signup_path
    assert_response :success
    post signup_path, params: { session: { username:  "Example User",
                                         email: "user@example.com",
                                         password: "password" } }
    assert_response :success
  end
end