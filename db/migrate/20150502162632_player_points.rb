class PlayerPoints < ActiveRecord::Migration
  def change
    add_column :players, :points, :integer, default: 0
  end
end
