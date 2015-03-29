require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one)
    @user2 = users(:two)
  end

  test "browser site home page" do
    get root_path
    assert_match /你好，陌生人！你没有登录，或者你还没有注册，但是你已经浏览这个页面/, @response.body
    assert_match /现在总共有 \d 个注册用户在查看这个网站，有 \d 个陌生人在查看这个网站/, @response.body
    post_via_redirect user_session_path, "user[name]" => @user.name, "user[password]"=> '11111111'
    assert_response :success
    assert_match Regexp.new("#{@user.name} 谢谢你登录了我们网站！你已经登录了"), @response.body
    assert_match /现在总共有 \d 个注册用户在查看这个网站，有 \d 个陌生人在查看这个网站/, @response.body
    delete destroy_user_session_path
    get root_path
    assert_match /你好，陌生人！你没有登录，或者你还没有注册，但是你已经浏览这个页面/, @response.body
    assert_match /现在总共有 \d 个注册用户在查看这个网站，有 \d 个陌生人在查看这个网站/, @response.body
  end
end
