class CreateSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.decimal :latitude,  precision: 11, scale: 8
      t.decimal :longitude,  precision: 11, scale: 8
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
