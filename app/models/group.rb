class Group < ActiveRecord::Base
  has_many :members, inverse_of: :group
  has_many :meetings, inverse_of: :group

  validates_presence_of :name
end
