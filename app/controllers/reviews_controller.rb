class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    # Associate my review together with my restaurant
    @review.restaurant = @restaurant
    if @review.save
      # Success
      redirect_to restaurant_path(@restaurant)
    else
      # Failure
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
