class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :destroy]
  
  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
  end

  def show
  end

  def create
    @spot = current_user.spots.build(spot_params)
    
    if @spot.save
      flash[:success] = '登録しました'
      redirect_to @spot
    else
      render :new
    end
    
  end

  def edit
  end
  
  def destroy
    @spot.destroy
    flash[:success] = 'スポットを削除しました'
    redirect_to spots_url
  end
  
  def search
  end
  
  def ajax_select
    if params[:lat].present?
      lat = params[:lat]
      lng = params[:lng]
      latlag = [lat, lng]
      @spots = Spot.near(latlag, 100, units: :km)
    else
      @spots = Spot.all
    end
  end
  
  def ajax_search_form
    if params[:latfield].present?
      lat = params[:latfield]
      lng = params[:lngfield]
      distance = params[:latlng][:distance]
      latlag = [lat, lng]
      @spots = Spot.near(latlag, distance, units: :km)
    else
      @spots = Spot.all
    end
  end
  
  private
  
  def set_spot
    @spot = Spot.find(params[:id])
  end
  
  def spot_params
    params.require(:spot).permit(:name, :address, :latitude, :longitude)
  end
  
end
