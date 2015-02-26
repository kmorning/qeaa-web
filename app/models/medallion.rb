class Medallion < ActiveRecord::Base
  has_one :event, as: :instance
  has_one :group, through: :events
  belongs_to :meeting
  belongs_to :member
end
