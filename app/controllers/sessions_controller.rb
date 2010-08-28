class SessionsController < ApplicationController
  skip_filter :login_required, :authenticate
  layout false
  
  def new
  end

  def create
    @admin = Admin.find_by_name_and_password(params[:name], params[:password])

    if @admin
      session[:admin_id] = @admin.id
      flash[:notice] = '登录成功'
      if session[:last_url]
        last_url = session[:last_url]
        session[:last_url] = nil
        redirect_to last_url
      else
        redirect_to "/"
      end
    else
      flash[:error] = '登录失败'
      render 'new'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to login_path
  end

end
