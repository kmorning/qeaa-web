class Medallion < ActiveRecord::Base
  has_one :event, as: :instance
  has_one :group, through: :event
  belongs_to :meeting
  belongs_to :member

  def date_str
    date.strftime('%B %d %Y')
  end

  def date_str=(val)
    self.date = Time.parse(val).at_end_of_day
  end
end
