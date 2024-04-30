class CreateAccountBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :account_balances do |t|
      t.decimal :balance, precision: 10, scale: 2, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
