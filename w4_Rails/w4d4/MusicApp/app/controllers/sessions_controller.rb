class SessionsController < ApplicationController
  def create
    email, password = session_params.values
    @user = User.find_by_credentials(email, password)
    @user.reset_session_token!

    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["wrong information"]
      redirect_to session_url
    end
  end

  def new
    render :new
  end

  def destroy
    if current_user
      logout
      redirect_to new_session_url
    else
      redirect_to new_session_url
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
