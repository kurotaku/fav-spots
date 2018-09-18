class AddColumnsToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :kana, :string
    add_column :spots, :access, :string
    add_column :spots, :phone, :integer
    add_column :spots, :overview, :string
  end
end
