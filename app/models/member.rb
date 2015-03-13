class Member < ActiveRecord::Base
  rolify
  has_many :member_emails, dependent: :destroy, inverse_of: :member
  has_one :account, dependent: :destroy, inverse_of: :member
  belongs_to :group, inverse_of: :members

  accepts_nested_attributes_for :member_emails

  acts_as_birthday :birthday

  validates :first_name, presence: true
  validates :last_initial, presence: true, length: { maximum: 1 }
  validates_associated :group
  validates_format_of :phone, 
    :with => %r{(1)?(?:-)?(?:\(|-)?([\d]{3})(?:\.|\-|\))([\d]{3})(?:\.|\-)([\d]{4})(?: ?x([\d]{3,5}))?}, :allow_blank => true
  #validates :email, uniqueness: true
  #validates_format_of :email,
  #  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def name
    [first_name, last_initial].compact.join(' ')
  end

  def birthday_age_on_next
    #if self.birthday_today?
    today = Date.parse(Time.zone.now.to_s)
    bday = Date.parse("#{self.birthday.strftime('%b %e')} #{today.strftime('%Y')}")
    if bday == today
      self.birthday_age
    else
      self.birthday_age + 1
    end
  end

  def birthday_str
    birthday.to_s
  end

  def birthday_str=(val)
    begin
      self.birthday = Date.parse(val)
    rescue ArgumentError=>e
      self.birthday = nil
    end
  end

end
