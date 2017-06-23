class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.order("#{sort_column} #{sort_direction}")
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      @restaurant.address = @restaurant.hash_address
      @restaurant.save
      flash[:success] = "#{@restaurant.name} has been added!"
      redirect_to restaurants_path
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

  def edit
    @restaurant = Restaurant.find(params[:id])
  end


  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :restaurant_type, :cuisine, :image)
  end
end
