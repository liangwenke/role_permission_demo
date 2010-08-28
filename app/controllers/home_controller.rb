class HomeController < ApplicationController
  skip_filter :login_required, :authenticate
  
  def index
  end

end
