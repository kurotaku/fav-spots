class Spot < ApplicationRecord

  belongs_to :user
  
  has_many :reviews
  
  geocoded_by :address
  after_validation :geocode
  
end
