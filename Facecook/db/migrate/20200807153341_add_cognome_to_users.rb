class AddCognomeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cognome, :string
  end
end
