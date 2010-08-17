# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :authenticate
  before_filter :active_main_navigation
  
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
      if controllers.include?(params[:controller])
        @active_main_navigation = active_nav.to_s
        return
      end
    end
    @active_main_navigation = 'admins'
  end
  
  def authenticate
    unless current_user
      flash[:notice] = "你还没有登录系统，请登录..."
      session[:last_url] = request.url
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= Admin.first
#    if session[:admin_id]
#      @current_admin ||= Admin.find_by_id(session[:admin_id])
#    end
  end
  
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
