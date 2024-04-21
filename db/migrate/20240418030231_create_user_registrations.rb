class CreateUserRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :user_registrations do |t|
      t.references :bid, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :bid_value, default: 0

      t.timestamps
    end
  end
end
