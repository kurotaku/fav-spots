class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'カテゴリーを登録しました'
      redirect_to categories_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:success] = 'カテゴリーを変更しました'
      redirect_to categories_url
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    
    flash[:success] = '部材カテゴリーは削除されました'
    redirect_to categories_url
  end
  
  private
  
  def set_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name, :slug, :category_type)
  end
end
