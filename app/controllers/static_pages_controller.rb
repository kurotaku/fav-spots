class StaticPagesController < ApplicationController
  def home
    @reviews = Review.all
  end

  def dbmap
  end
end
