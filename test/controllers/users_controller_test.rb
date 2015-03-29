require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test "should not allow annoymous access show" do
    get :show, id: @user
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should show user" do
    sign_in @user
    get :show, id: @user
    assert_response :success
  end

  test "should not allow annoymous access update_minutes" do
    post :update_minutes, minutes: 5
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update user(one) sign_in_minutes" do
    sign_in @user
    post :update_minutes, minutes: 5, format: :json
    @user.reload
    assert_equal 5, @user.sign_in_minutes
  end

  test "should not update user(two) sign_in_minutes" do
    sign_in @user2
    post :update_minutes, minutes: 5, format: :json
    @user2.reload
    assert_equal 10, @user2.sign_in_minutes
  end

end
