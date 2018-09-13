class CategorySpot < ApplicationRecord
  belongs_to :spot
  belongs_to :category
end
