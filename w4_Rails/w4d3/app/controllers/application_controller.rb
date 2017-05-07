class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def no_user
    redirect_to cats_url if current_user.nil?
  end

  def login!(user)
    @current_user = user
    #session is something Rails gives you and is the tamper-proof cookie
    session[:session_token] = user.session_token
  end

  def logout!
    #need to call the method current_user and not @current_user instance
    #as @current_user is not defined just because it is defined in
    #login, so @current_user was nil. by calling the method, it will
    #then define @current_user
    user = current_user
    if !user.nil?
      user.reset_session_token!
      session[:session_token] = nil
    else
      redirect_to new_session_url
    end
  end
end
