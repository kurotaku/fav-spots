class ChangeDatatypePhoneOfSpots < ActiveRecord::Migration[5.1]
  def up
    change_column :spots, :phone, :string
  end

  def down
    change_column :spots, :phone, :integer
  end
end
