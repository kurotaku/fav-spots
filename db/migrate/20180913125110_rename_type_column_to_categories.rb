class RenameTypeColumnToCategories < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :type, :category_type
  end
end
