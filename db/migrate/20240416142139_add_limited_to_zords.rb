class AddLimitedToZords < ActiveRecord::Migration[7.0]
  def change
    add_column :zords, :limited, :boolean, default: false
  end
end
