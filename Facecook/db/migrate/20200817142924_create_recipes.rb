class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :nome
      t.string :categoria
      t.text :immagine
      t.text :descrizione
      t.string :link

      t.timestamps
    end
  end
end
