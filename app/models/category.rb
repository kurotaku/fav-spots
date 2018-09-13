class Category < ApplicationRecord
  has_many :spots, through: :category_spots
end
