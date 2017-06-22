class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user_id = current_user.id

    if @experience.save
      redirect_to experience_path(@experience)
    else
      render 'new'
    end
  end


  private
    def experience_params
      params.require(:experience).permit(:restaurant_id, :date)
    end
end