class CatsController < ApplicationController
  before_action :no_user, only: [:new, :create, :edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    #current_user returns a user object, cats is a method on user
    #from user model (user has_many :cats), new Rails is calling new
    #on the model and will make a new Cat object.
    @cat = current_user.cats.new(cat_params)
    # user_id = current_user.id
    # @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = current_user.cats.find(params[:id])
    #@cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = current_user.cats.find(params[:id])
    #@cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
