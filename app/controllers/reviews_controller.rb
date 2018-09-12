class ReviewsController < ApplicationController
  def index
  end

  def new
    @spot = Spot.find(params[:id])
    @review = Review.new(spot_id: @spot.id)
  end

  def create
    @spot = Spot.find(params[:id])
    @review = current_user.reviews.build(review_params)
    
    if @review.save
      flash[:success] = '投稿しました'
      redirect_to @spot
    else
      render :new
    end
  end

  def destroy
  end
  
  private
  
  def review_params
    params.require(:review).permit(:comment, :spot_id, :image)
  end
  
end
