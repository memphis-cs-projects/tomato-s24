class AddBasePriceToBids < ActiveRecord::Migration[7.0]
  def change
    add_column :bids, :base_price, :decimal
  end
end
