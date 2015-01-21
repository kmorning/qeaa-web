class Member < ActiveRecord::Base
  rolify
  belongs_to :group, inverse_of: :members
end
