class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_login_status!
    unless session[:user_id]  and $name
      redirect_to root_url
      return
    end
  end
end
