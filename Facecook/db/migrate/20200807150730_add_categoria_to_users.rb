class AddCategoriaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :categoria, :integer
  end
end
