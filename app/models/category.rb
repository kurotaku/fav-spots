class Category < ApplicationRecord
  has_many :category_spots
  has_many :spots, through: :category_spots
end
