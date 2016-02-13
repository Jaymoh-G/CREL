class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :pName
      t.string :county
      t.string :locality
      t.string :pDescription
      t.integer :price
      t.string :fName
      t.string :lName
      t.integer :phone
      t.string :url

      t.timestamps null: false
    end
  end
end
