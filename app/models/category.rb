class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :slug, presence: true, length: { maximum: 50 }
  
  has_many :category_spots
  has_many :spots, through: :category_spots
end
