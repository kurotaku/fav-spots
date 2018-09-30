class AddAttachmentToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :attachment, :string
  end
end
