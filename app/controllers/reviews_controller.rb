class ReviewsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :destroy]
  before_action :set_review, only: []
  
  def index
  end
  
  def show
    @spot = Spot.find(params[:id])
    @review = Review.find(params[:review_id])
  end

  def new
    @spot = Spot.find(params[:id])
    @review = Review.new(spot_id: @spot.id)
    @review.pictures.build
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
    @review = Review.find(params[:review_id])
    @spot = @review.spot
    @review.destroy
    flash[:success] = '口コミを削除しました'
    redirect_to spot_url(@spot)
  end
  
  private
  
  def set_review
    @review = Review.find(params[:id])
  end
  
  def review_params
    params.require(:review).permit(:comment, :spot_id, pictures_attributes: [:id, :image, :comment, :label])
  end
  
end
