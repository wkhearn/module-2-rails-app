class ReviewsController < ApplicationController


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
      redirect_to restaurant_path(@review.restaurant)
    else
      render 'new'
    end
  end


private
def review_params
  params.require(:review).permit(:restaurant_id, :rating, :wait, :content)
end


end
