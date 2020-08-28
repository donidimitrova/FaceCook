class AddAttachmentImmagineToRecipes < ActiveRecord::Migration[5.2]
  def self.up
    change_table :recipes do |t|
      t.attachment :immagine
    end
  end

  def self.down
    remove_attachment :recipes, :immagine
  end
end
