class AddZordToNotification < ActiveRecord::Migration[7.0]
  def change
    add_reference :notifications, :zord, foreign_key: true
  end
end
