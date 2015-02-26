class Group < ActiveRecord::Base
  resourcify
  has_many :members, inverse_of: :group
  has_many :meetings, inverse_of: :group
  has_many :events
  has_many :medallions, through: :events, source: :instance, source_type: 'Medallion'

  acts_as_birthday :anniversary

  validates_presence_of :name
end
