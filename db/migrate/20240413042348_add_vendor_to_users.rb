class AddVendorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :vendor, :boolean, default: false
  end
end
