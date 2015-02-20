class Api::V1::UserCountController < ActionController::Base
  def all
    @loginers = $redis.zcount :login_users, 5.minutes.ago.to_i, Time.now.to_i
    @guests = $redis.zcount :guest_users, 5.minutes.ago.to_i, Time.now.to_i
  end
end
