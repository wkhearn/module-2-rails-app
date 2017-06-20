class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:success] = "#{@restaurant.name} has been added!"
      redirect_to new_review_path
    else
      render 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :restaurant_type, :cuisine)
  end
end
