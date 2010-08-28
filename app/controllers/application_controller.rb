class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  
  before_filter :login_required, :authenticate
  before_filter :active_main_navigation

  helper_method :current_admin, :current_user
  
  private
  
  def active_main_navigation
    { :admins => ['admins'], 
      :departments => ['departments'], 
      :roles => ['roles'], 
      :modules => ['system_modules'], 
      :permissions => ['permissions'], 
      :permission_lines => ['permission_lines'], 
      :functions => ['system_functions'], 
      :operations => ['operations'], 
      :audits => ['audits']  
    }.each do |active_nav, controllers|
      if controllers.include?(controller_name)
        @active_main_navigation = active_nav.to_s
        return
      end
    end
    @active_main_navigation = 'admins'
  end
  
  def login_required
    unless current_admin
      flash[:notice] = "你还没有登录系统，请登录..."
      session[:last_url] = request.url
      redirect_to login_path
    end
  end

  def authenticate
    store_location
    unless current_admin.allow_to?(params[:controller], params[:action], request.method.to_s)
      flash[:error] = "这个操作你没有权限！"
      if request.xhr?
        render :js => "window.location.href='#{session[:return_to]}'"
      else
        return_to
      end
    end
  end

  def current_admin
    if session[:admin_id]
     @current_admin ||= Admin.find_by_id(session[:admin_id])
    end
  end

  alias current_user current_admin
  
  def store_location
    session[:return_to] = request.referrer
  end
  
  def return_to
    redirect_to session[:return_to]
  end
  
  def get_client_key
    #session[:client_key] ||= UUIDTools::UUID.random_create.to_s
  end
end
