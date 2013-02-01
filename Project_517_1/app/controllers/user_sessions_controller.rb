class UserSessionsController < ApplicationController

  # GET /user_sessions/new
  # GET /user_sessions/new.json
  def new
  end

  # POST /user_sessions
  # POST /user_sessions.json
  def create
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to view_posts_path, :notice => "Welcome!"
    else
      flash.now.alert = "Invalid login credentials"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been successfully logged out."
  end
end
