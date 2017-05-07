class SessionsController < ApplicationController
  before_action :no_user, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
      params[:user][:password])
    if @user
      login!(@user)
      #session[:session_token] = User.reset_session_token!
      redirect_to user_url(@user)
    else
      flash[:errors] = "Credentials were wrong"
      redirect_to new_session_url
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end
end
