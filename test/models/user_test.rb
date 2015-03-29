require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should not save article without name" do
    user = User.new
    assert_not user.save
  end

  test "instance methods" do
    user = users(:one)
    assert_respond_to user, :email_required?, "should override devise email_required? method"
    assert_respond_to user, :email_changed?, "should override devise email_changed? method"
  end

end
