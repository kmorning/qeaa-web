class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  rolify
  belongs_to :group, inverse_of: :members

  validates :first_name, presence: true
  validates :last_initial, presence: true, length: { maximum: 1 }
  validates_associated :group
  validates_format_of :phone, 
    :with => %r{(1)?(?:-)?(?:\(|-)?([\d]{3})(?:\.|\-|\))([\d]{3})(?:\.|\-)([\d]{4})(?: ?x([\d]{3,5}))?}, :allow_blank => true
  validates :email, uniqueness: true
  validates_format_of :email,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def name
    [first_name, last_initial].compact.join(' ')
  end

end
