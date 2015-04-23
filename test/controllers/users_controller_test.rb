require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.new(name: "Maciek", email: "maciek@example.com",
                    password: "foobar", password_confirmation: "foobar")
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, name: @user.name,
                            password: @user.password,
                            password_confirmation: @user.password_confirmation }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    @user.save
    get :show, id: @user.id
    assert_response :success
  end

  test "should get edit" do
    @user.save
    get :edit, id: @user.id
    assert_response :success
  end

  test "should update user" do
    @user.save
    patch :update, id: @user.id, user: { email: @user.email, name: @user.name,
                                      password: @user.password,
                                      password_confirmation: @user.password_confirmation }
    assert_redirected_to user_path(@user.id)
  end

  test "should destroy user" do
    @user.save
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.id
    end

    assert_redirected_to users_path
  end
end
