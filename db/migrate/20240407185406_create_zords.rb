class CreateZords < ActiveRecord::Migration[7.0]
  def change
    create_table :zords do |t|
      t.string :name
      t.string :theme
      t.string :material
      t.integer :capacity
      t.string :ability
      t.decimal :price
      t.text :description
      t.integer :quantity
      t.decimal :avg_rating
      t.timestamps
    end
  end
end
