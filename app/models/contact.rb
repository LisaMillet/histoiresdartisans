class Contact < MailForm::Base
  attribute :last_name, validate: true
  attribute :first_name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true
  attribute :subject, validate: true

  def headers
    {
      to: "contact@histoiresdartisans.com", # change this to be the email you want sent to
      subject: "#{subject}",
      from: "contact@histoiresdartisans.com",  # change this to be the email it is coming from
      reply_to: %("#{first_name}" <#{email}>)
    }
  end
end
