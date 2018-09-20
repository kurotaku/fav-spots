class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    @reviews = @user.reviews
  end

  def new
    @user = User.new(root: false, admin: false)
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザー登録しました'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を変更しました'
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    
    flash[:success] = 'ユーザーは削除されました'
    redirect_to users_url
  end
  
  def mypage
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :root, :admin, :password, :password_confirmation)
  end
end
