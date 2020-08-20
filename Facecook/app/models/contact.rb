class Contact < MailForm::Base
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject,   :validate => true
  attribute :message
  attribute :nickname,  :captcha  => true


  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => %(#{subject}),
      :to => "contact.facecook@gmail.com",
      :from => %(<#{email}>)
    }
  end
end
