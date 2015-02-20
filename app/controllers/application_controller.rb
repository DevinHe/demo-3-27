class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :log_user_access
  helper_method :login_users_count, :guest_users_count

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end

  private
    def log_user_access
      if current_user
        $redis.zadd :login_users, Time.now.to_i, session[:session_id]
      else
        $redis.zadd :guest_users, Time.now.to_i, session[:session_id]
      end
    end

    def login_users_count
      $redis.zcount :login_users, 5.minutes.ago.to_i, Time.now.to_i
    end

    def guest_users_count
      $redis.zcount :guest_users, 5.minutes.ago.to_i, Time.now.to_i
    end
end