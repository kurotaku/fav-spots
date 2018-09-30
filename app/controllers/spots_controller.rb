class SpotsController < ApplicationController
  before_action :require_admin_logged_in, only: [:new, :create, :edit, :updeate, :destroy]
  before_action :set_spot, only: [:show, :edit, :update, :destroy, :reviews]
  
  def index
    @spots = Spot.all.order('created_at DESC')
  end

  def new
    @spot = Spot.new
    @spot.category_spots.build
  end

  def show
    @reviews = @spot.reviews.order('created_at DESC')
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
  
  def prefs
    @prefs = JpPrefecture::Prefecture.all
  end
  
  def pref
    @spots = Spot.where(pref: params[:pref])
    @pref = JpPrefecture::Prefecture.find name: params[:pref]
    @prefname = @pref.name
  end
  
  def search
    @features = Category.where(category_type: 'feature')
    @lucks = Category.where(category_type: 'luck')
    @routes = Category.where(category_type: 'route')
  end
  
  #読み込み時現在地から
  def ajax_select
    if params[:lat].present?
      lat = params[:lat]
      lng = params[:lng]
      latlag = [lat, lng]
      @spots = Spot.near(latlag, 20, units: :km)
    else
      @spots = Spot.all
    end
  end
  
  #現在地から距離を変えて
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
  
  #カテゴリーを絞り込み
  def ajax_category_select
    if params[:value].present?
      category_type = params[:value]
      @categories = Category.where(category_type: category_type)
    else
      @categories = Category.all
    end
  end
  
  #検索条件にマッチしたものを
  def ajax_search
    # 都道府県あり
    if params[:area][:pref].present?
      pref = params[:area][:pref]
      if params[:categories][:category_id].present?
        category_id = params[:categories][:category_id]
        category = Category.find_by(id: category_id)
        @spots = category.spots.where(pref: pref)
      else
        @spots = Spot.where(pref: pref)
      end
    # 全国
    else
      if params[:categories][:category_id].present?
        category_id = params[:categories][:category_id]
        category = Category.find_by(id: category_id)
        @spots = category.spots
      else
        @spots = Spot.all
      end
    end
  end
  
  #キーワード検索
  def ajax_keyword
    if params[:keyword].present?
      keyword = params[:keyword]
      if params[:pref].present?
        pref = params[:pref]
        @spots = Spot.where(pref: pref).where("kana LIKE ? OR name LIKE ?","%" + keyword + "%", "%" + keyword + "%")
      else
        @spots = Spot.where("kana LIKE ? OR name LIKE ?","%" + keyword + "%", "%" + keyword + "%")
      end
    else
      @spots = Spot.all
    end
  end
  
  def reviews
    @reviews = @spot.reviews.order('created_at DESC')
  end
  
  private
  
  def set_spot
    @spot = Spot.find(params[:id])
  end
  
  def spot_params
    params.require(:spot).permit(:name, :kana, :address, :access, :phone, :pref, :latitude, :longitude, :overview, :since, :sect, :deity, { :category_ids=> []})
  end
  
end
