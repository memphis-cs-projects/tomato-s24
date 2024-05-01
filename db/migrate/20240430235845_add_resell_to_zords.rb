class AddResellToZords < ActiveRecord::Migration[7.0]
  def change
    add_column :zords, :used, :boolean
  end
end
