class SpotsController < ApplicationController
  before_action :require_admin_logged_in, only: [:new, :create, :edit, :updeate, :destroy]
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  
  def index
    @spots = Spot.all
  end

  def new
    @spot = Spot.new
    @spot.category_spots.build
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
  
  def update
    if @spot.update(spot_params)
      flash[:success] = 'スポット情報を変更しました'
      redirect_to @spot
    else
      render :edit
    end
  end
  
  def destroy
    @spot.destroy
    flash[:success] = 'スポットを削除しました'
    redirect_to spots_url
  end
  
  def pref
    @spots = Spot.where(pref: params[:pref])
    @pref = JpPrefecture::Prefecture.find name: params[:pref]
    @prefname = @pref.name
  end
  
  def search
    @prefs = Category.where(category_type: 'pref')
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
  
  def ajax_location
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
  
  def ajax_search
    if params[:keywords].present?
      pref = params[:keywords][:pref]
      @spots = Spot.where(pref: pref)
    else
      @spots = Spot.all
    end
  end
  
  private
  
  def set_spot
    @spot = Spot.find(params[:id])
  end
  
  def spot_params
    params.require(:spot).permit(:name, :address, :pref, :latitude, :longitude, { :category_ids=> []})
  end
  
end
