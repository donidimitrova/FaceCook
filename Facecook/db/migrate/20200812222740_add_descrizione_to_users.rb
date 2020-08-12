class AddDescrizioneToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :descrizione, :text
  end
end
