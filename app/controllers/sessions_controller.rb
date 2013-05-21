class SessionsController < ApplicationController
  def create
#    render :text => request.env['omniauth.auth'].inspect
    auth_hash = request.env['omniauth.auth']
    $name=auth_hash["info"]["nickname"]
    $provider=auth_hash["provider"]
#    render :text => "<pre>"+request.env["omniauth.auth"].to_yaml+"</pre>"


#   Logout user to force authorisation every time app is run
    session[:user_id] = nil


    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      User.find(session[:user_id]).add_provider(auth_hash)

#      render :text => "You are already authorized and logged in through #{auth_hash["provider"].capitalize} "
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)

      # Create the session
      session[:user_id] = auth.user.id

#      render :text => "Welcome #{auth.user.nickname} , you are authorized and logged in through #{auth_hash["provider"].capitalize} "
#      render :text => "<pre>"+auth_hash.to_yaml+"</pre>"
    end
#    $name=auth.user.nickname
#    flash[:notice]= "Welcome #{auth.user.nickname} , you are authorized and logged in through #{auth_hash["provider"].capitalize}"

    redirect_to :controller =>'bookmarks'
  end

  def destroy
    session[:user_id] = nil
#    render :text => "You've logged out!"
    redirect_to :controller =>'bookmarks'

  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
