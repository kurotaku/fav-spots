class CreateCategorySpots < ActiveRecord::Migration[5.1]
  def change
    create_table :category_spots do |t|
      t.references :spot, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
