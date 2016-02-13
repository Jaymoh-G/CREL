class AddCategoryIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :category_id, :integer
  end
end
