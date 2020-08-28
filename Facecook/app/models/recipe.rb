class Recipe < ApplicationRecord
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_attached_file :immagine, :styles { :recipe_index => "250x250", :recipe_show => "325x475" }, :default_url =>""
  validates_attachment_content_type :immagine, content_type: /\Aimage\/.*\Z/

end
