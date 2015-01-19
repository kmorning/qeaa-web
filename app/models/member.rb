class Member < ActiveRecord::Base
  belongs_to :group, inverse_of: :members
end
