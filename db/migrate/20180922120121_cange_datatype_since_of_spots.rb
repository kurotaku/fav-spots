class CangeDatatypeSinceOfSpots < ActiveRecord::Migration[5.1]
  def change
    change_column :spots, :since, :string
  end
end
