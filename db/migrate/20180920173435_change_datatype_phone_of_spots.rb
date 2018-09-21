class ChangeDatatypePhoneOfSpots < ActiveRecord::Migration[5.1]
  def change
    change_column :spots, :phone, :string
  end
end
