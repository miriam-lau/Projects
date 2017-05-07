class SessionsController < ApplicationController
  def index
  end

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
      params[:user][:password])
    if @user
      sign_in(@user)
      #redirect_to
    else
      flash.now[:errors] = "Invalid credentials"
      redirect_to new_sessions_url
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    sign_out
    redirect_to new_sessions_url
  end
end
