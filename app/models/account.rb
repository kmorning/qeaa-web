class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable

  attr_accessor :email

  belongs_to :member, inverse_of: :account
  
  validates_uniqueness_of :member_id
  validates_presence_of :password, on: :create
  validates_confirmation_of :password, on: :create
  validates_length_of :password, within: Devise.password_length, allow_blank: true
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if email = conditions.delete(:email)
      Member.includes(:member_emails).where(member_emails: {email: email}).first.account
    else
      super(wardenb_conditions)
    end
  end
end
