class Spot < ApplicationRecord

  belongs_to :user
  
  has_many :reviews
  has_many :categories, through: :category_spots
  
  geocoded_by :address
  after_validation :geocode
  
end
