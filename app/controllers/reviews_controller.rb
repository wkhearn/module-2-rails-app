class ReviewsController < ApplicationController
  before_action :authenticated, :except => [:index, :show]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id

    if @review.save
      flash[:success] = "Thanks for adding a review for #{@review.restaurant.name}"
      redirect_to restaurant_path(@review.restaurant)
    else
      error = @review.errors.full_messages
      flash[:danger] = error
      render 'new'
    end
  end


  private
    def review_params
      params.require(:review).permit(:restaurant_id, :rating, :wait, :content)
    end


end
