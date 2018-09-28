class Spot < ApplicationRecord

  belongs_to :user
  
  has_many :reviews
  has_many :category_spots
  has_many :categories, through: :category_spots
  has_many :pictures, through: :reviews
  
  geocoded_by :address
  after_validation :geocode
  
end
