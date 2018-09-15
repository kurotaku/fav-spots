class AddPrefToSpots < ActiveRecord::Migration[5.1]
  def change
    add_column :spots, :pref, :string
  end
end
