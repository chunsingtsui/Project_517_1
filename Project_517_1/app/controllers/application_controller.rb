class ApplicationController < ActionController::Base
  helper_method :current_user

  private

  # Returns the current user if user is logged in, otherwise returns nil
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
