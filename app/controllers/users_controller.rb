class UsersController < ApplicationController

  before_action :authenticated, only: [:show]


  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      error = @user.errors.full_messages
      flash[:danger] = error
      redirect_to signup_path
    end
  end

  def show
    @user = User.find(params[:id])
    # if @user == current_user
    @user_reviews = Review.where("user_id = ?", params[:id]).order(created_at: :desc).limit(3)
    @user_restaurants = Review.where("user_id = ?", params[:id]).group(:restaurant_id)
    @user_experiences = ExperienceSignup.where("user_id = ?", params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id == params[:id]

    else
      flash[:danger] = "You cannot edit other people's profiles!"
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :instructor, :cohort_id, :profile_pic)
  end

end
