require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_template :home
    assert_template layout: "layouts/application"
    assert_match /你好，陌生人！你没有登录，或者你还没有注册，但是你已经浏览这个页面/, @response.body
    assert_match /现在总共有 \d 个注册用户在查看这个网站，有 \d 个陌生人在查看这个网站/, @response.body
  end

  test "should get home and match" do
    sign_in @user
    get :home
    assert_response :success
    assert_template :home
    assert_template layout: "layouts/application"
    assert_match Regexp.new("#{@user.name} 谢谢你登录了我们网站！你已经登录了 #{@user.sign_in_count} 次了，总共登录时间是<em id='stay_m'>#{@user.sign_in_minutes}</em>分钟了。"), @response.body
    assert_match /现在总共有 \d 个注册用户在查看这个网站，有 \d 个陌生人在查看这个网站/, @response.body
  end
end
