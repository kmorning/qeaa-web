class Contact < MailForm::Base
  #attribute :recipient
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject_str
  attribute :message
  attribute :nickname, captcha: true

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :message

  # TODO: Use database lookup instead.
  @@recipients =  {
                    webmaster: 'Webmaster',
                    pic: 'Public Information Chair',
                    dcm: 'District Committee Member',
                    alternatedcm: 'Alternate DCM',
                    selfsupport: 'Self Support Chair',
                    archives: 'Archives Chair',
                    secretary: 'Secretary',
                    treasurer: 'Treasurer',
                    treatment: 'Treatment Chair',
                    grapevine: 'Grapevine Chair'
                  }

  def recipient
    @recipient
  end

  def recipient=(value)
    @recipient = value.parameterize.underscore.to_sym
  end

  def recipient_valid?
    not @@recipients[recipient].nil?
  end

  def recipient_name
    @@recipients[recipient] if recipient
  end

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: subject_str.nil? ? "Website contact request" : subject_str,
      # TODO: validate recipient
      to: "#{recipient}@#{Rails.application.secrets.domain_name}",
      from: %("#{name}" <#{email}>)
    }
  end
end

