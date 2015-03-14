class Contact < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject_str
  attribute :message
  attribute :nickname, captcha: true

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: subject_str.blank? ? "Website contact request" : subject_str,
      to: "webmaster@#{Rails.application.secrets.domain_name}",
      from: %("#{name}" <#{email}>)
    }
  end
end

