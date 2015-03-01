class Medallion < ActiveRecord::Base
  has_one :event, as: :instance
  has_one :group, through: :events
  belongs_to :meeting
  belongs_to :member

  #accepts_nested_attributes_for :event
end
