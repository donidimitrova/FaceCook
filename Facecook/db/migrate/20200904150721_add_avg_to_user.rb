class AddAvgToUser < ActiveRecord::Migration[5.2]
  def change
   add_column :users, :avg, :float
  end
end
