class RemoveCuocoAppassionato < ActiveRecord::Migration[5.2]
  def change
   remove_column :users, :cuoco
   remove_column :users, :appassionato
  end
end
