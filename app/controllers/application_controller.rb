class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :log_user_access
  before_action :set_seo_meta

  def render_404
    render_optional_error_file(404)
  end

  def render_optional_error_file(status_code)
    status = status_code.to_s
    fname = %W(404 403).include?(status) ? status : 'unknown'
    render template: "/errors/#{fname}", format: [:html],
           handler: [:erb], status: status, layout: 'application'
  end

  def set_seo_meta(title = nil, meta_keywords = nil, meta_description = nil)
    @page_title = title.nil? ? 'Trick Demo' : title
    @meta_keywords = meta_keywords.nil? ? '用户登录、记录小Demo' : meta_keywords
    @meta_description = meta_description.nil? ? '这是一个简单的Demo项目，实现了一个基本的有数据库支持的网站。' : meta_keywords
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:name, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end

  private
    def log_user_access
      return if session[:session_id] == ""

      if current_user
        $redis.zadd :login_users, Time.now.to_i, current_user.id
      else
        $redis.zadd :guest_users, Time.now.to_i, session[:session_id]
      end

      if params[:controller] == "devise/registrations" && params[:action] == "create"
        $redis.zrem :guest_users, session[:session_id]
      elsif params[:controller] == "devise/sessions" && (params[:action] == "create" || params[:action] == "destroy")
        $redis.zrem :login_users,current_user.id if current_user
        $redis.zrem :guest_users,session[:session_id]
      end
    end

end
