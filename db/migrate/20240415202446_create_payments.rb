class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :card_type
      t.integer :card_number
      t.date :expiry_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
