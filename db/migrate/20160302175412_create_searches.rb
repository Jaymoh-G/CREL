class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :county
      t.string :locality
      t.integer :category_id
      t.decimal :min_price
      t.decimal :max_price
      t.string :name

      t.timestamps null: false
    end
  end
end
