class CangeDatatypeSinceOfSpots < ActiveRecord::Migration[5.1]
  def up
    change_column :spots, :since, :string
  end

  def down
    change_column :spots, :since, :integer
  end
end
