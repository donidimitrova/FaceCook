class WelcomeMailer < ApplicationMailer
    def welcome_send(user)
        @user = user
        mail to: user.email, subject: "Registrazione avvenuta con successo", from: "dimitrovadonika@gmail.com"
    end
end
