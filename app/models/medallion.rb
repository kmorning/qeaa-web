class Medallion < ActiveRecord::Base
  has_one :event, as: :instance, dependent: :destroy
  has_one :group, through: :event
  belongs_to :meeting
  belongs_to :member

  validates_presence_of :meeting_id
  validates_presence_of :member_id
  validates_presence_of :years
  validates_presence_of :date_str

  def date_str
    date.strftime('%B %d %Y') if date
  end

  def date_str=(val)
    self.date = DateTime.parse(val).at_end_of_day
  end
end
