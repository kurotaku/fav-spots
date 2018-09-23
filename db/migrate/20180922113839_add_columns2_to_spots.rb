class AddColumns2ToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :deity, :string
    add_column :spots, :since, :integer
    add_column :spots, :sect, :string
  end
end
