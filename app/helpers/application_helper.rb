module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

  def login_users_count
    $redis.zremrangebyscore :login_users,"-inf",6.minutes.ago.to_i
    $redis.zcount :login_users, 5.minutes.ago.to_i, Time.now.to_i

  end

  def guest_users_count
    $redis.zremrangebyscore :guest_users,"-inf",6.minutes.ago.to_i
    $redis.zcount :guest_users, 5.minutes.ago.to_i, Time.now.to_i
  end

end
