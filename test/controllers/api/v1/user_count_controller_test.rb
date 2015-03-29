require 'test_helper'

class Api::V1::UserCountControllerTest < ActionController::TestCase
  test "should respond to all" do
    get :all, format: :json
    assert_response :success
  end
end
