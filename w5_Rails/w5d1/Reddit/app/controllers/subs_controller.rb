class SubsController < ApplicationController
  before_filter :require_signed_in!
  before_filter :require_moderator!, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    # @sub = current_user.subs.find(params[:id])
    # @sub.user_id = current_user.id
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_moderator!
    @sub = Sub.find(params[:id])
    unless @sub.moderator == current_user
      flash[:errors] = "You are not the moderator"
      redirect_to subs_url
    end
  end
end
