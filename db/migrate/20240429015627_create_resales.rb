class CreateResales < ActiveRecord::Migration[7.0]
  def change
    create_table :resales do |t|
      t.references :zord, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :new_price
      t.string :condition
      t.string :status

      t.timestamps
    end
  end
end
