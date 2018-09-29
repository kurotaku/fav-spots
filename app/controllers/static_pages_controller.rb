class StaticPagesController < ApplicationController
  def home
    @reviews = Review.limit(10).order('created_at DESC')
    @prefs = JpPrefecture::Prefecture.all
  end

  def dbmap
  end
end
