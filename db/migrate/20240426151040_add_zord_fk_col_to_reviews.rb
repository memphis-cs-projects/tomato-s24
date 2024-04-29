class AddZordFkColToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :zord, foreign_key: true
  end
end
