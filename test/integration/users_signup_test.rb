require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "foo",
                               password_confirmation: "bar" }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation' do
      assert_select 'li', 4
    end
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Maciek",
                                            email: "maciek@example.com",
                                            password: "SageOne123",
                                            password_confirmation: "SageOne123" }
    end
    assert_template 'users/show'
    assert_not flash.empty?
    assert is_logged_in?
  end
end
