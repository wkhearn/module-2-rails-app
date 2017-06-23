class ExperienceSignupsController < ApplicationController

  def index
    @experience_signups = ExperienceSignup.all
  end

  def new
    @experience_signup = ExperienceSignup.new
  end

  def show
    @experience_signup = ExperienceSignup.find(params[:id])
  end

  def create
    @experience_signup = ExperienceSignup.new(experience_id: params[:experience_id], user_id: current_user.id)
    if @experience_signup.save
      flash[:success] = "You have successfully signed up to go to #{@experience_signup.experience.restaurant.name}!"
      redirect_to user_path(@experience_signup.user)
    end
  end

end
