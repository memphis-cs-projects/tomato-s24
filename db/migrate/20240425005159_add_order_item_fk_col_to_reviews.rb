class AddOrderItemFkColToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :order_item, foreign_key: true
  end
end
