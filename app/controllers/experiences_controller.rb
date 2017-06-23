class ExperiencesController < ApplicationController
  before_action :authenticated, :except => [:index, :show]

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
