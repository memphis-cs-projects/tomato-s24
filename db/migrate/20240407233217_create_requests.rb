class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :type
      t.string :description
      t.string :status
      t.string :theme
      t.string :material
      t.integer :capacity
      t.string :ability
      t.integer :price
      t.string :messsage

      t.timestamps
    end
  end
end
