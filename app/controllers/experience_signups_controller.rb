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
    @experience_signup = ExperienceSignup.new(exp_signup_params)
    @experience_signup.user_id = current_user.id

    if @experience_signup.save
      redirect_to experience_path(@experience_signup.experience)
    else
      render 'new'
    end
  end


  private
    def exp_signup_params
      params.require(:experience_signup).permit(:experience_id)
    end

end
