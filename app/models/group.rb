class Group < ActiveRecord::Base
  has_many :members, inverse_of: :group
end
