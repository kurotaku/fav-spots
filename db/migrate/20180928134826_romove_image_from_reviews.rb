class RomoveImageFromReviews < ActiveRecord::Migration[5.1]
  def up
    remove_column :reviews, :image
  end

  def down
    add_column :reviews, :image, :string
  end
end
