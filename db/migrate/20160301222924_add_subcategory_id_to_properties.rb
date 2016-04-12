class AddSubcategoryIdToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :subcategory_id, :integer
  end
end
