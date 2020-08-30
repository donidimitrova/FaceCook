class Recipe < ApplicationRecord
 
  

                     has_attached_file :immagine, styles: { medium: "300x300", thumb: "100x100",quality:100 }

                     validates_attachment :immagine,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
                     # Validate content type
                     validates_attachment_content_type :immagine, content_type: /\Aimage/
                     # Validate filename
                     validates_attachment_file_name :immagine, matches: [/png\Z/, /jpe?g\Z/]
                     # Explicitly do not validate
                     do_not_validate_attachment_file_type :immagine

end
