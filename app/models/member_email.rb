class MemberEmail < ActiveRecord::Base
  belongs_to :member, inverse_of: :member_emails

  validates :email, uniqueness: true, :allow_blank => true, :allow_nil => true
  validates_format_of :email,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :allow_blank => true
end
