class Group < ActiveRecord::Base
  resourcify
  has_many :members, inverse_of: :group
  has_many :meetings, inverse_of: :group

  acts_as_birthday :anniversary

  validates_presence_of :name
end
