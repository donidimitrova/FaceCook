class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]
  
  has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100" }
  # Validate content type
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  # Explicitly do not validate
  do_not_validate_attachment_file_type :avatar

  do_not_validate_attachment_file_type :image

  

#Add custom methods to the User model

         def self.new_with_session(params, session)
          super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
            end
          end
        end
        
        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.username = auth.info.name
            user.name = auth.info.first_name
            user.cognome = auth.info.last_name
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
      
            user.image =auth.info.image # assuming the user model has an image

            user.categoria = nil
            user.descrizione= ' '
            user.save!
          end
        end

        after_create :welcome_send
        def welcome_send
          WelcomeMailer.welcome_send(self).deliver
          
        end 
        
end
