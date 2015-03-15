class Meeting < ActiveRecord::Base
  belongs_to :group, inverse_of: :meetings

  serialize :time, Tod::TimeOfDay
  
  enum category: [:open, :closed]

  enum format: [:discussion,
                :speaker,
                :beginners,
                :step,
                :tradition,
                :big_book,
                :business,
                :group_inventory,
                :service,
                :grapevine,
                :other]

  enum weekday: [:sunday,
                 :monday,
                 :tuesday,
                 :wednesday,
                 :thursday,
                 :friday,
                 :saturday]

  enum frequency: [:weekly, :monthly, :single]

  #TODO: Need validation to make sure a given group doesn't have
  # multiple meetings on the same day and time.  The validation
  # below breaks TimeOfDay storage to database.  Also, when start and
  # and end dates are implemented, meetings can have same day and time
  # as long as their start and end dates don't overlap.
  #validates :group_id, uniqueness: {scope: [:weekday, :time]}
  validates_presence_of :group_id, :unless => :name?
  validates_presence_of :name, :unless => :group_id?
  validates_presence_of :facility
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :weekday
  validates_presence_of :time_str
  validates_presence_of :category
  #validates_presence_of :format

  def time_str
    time.strftime("%l:%M %p") if time
  end

  def time_str=(val)
    self.time = Tod::TimeOfDay.try_parse(val)
  end

  def notes
    if  self.accessible?
      note_str = "(WA)"
      if self.notice
        note_str += ", " + self.notice
      end
    else
      note_str = self.notice
    end
    note_str
  end

end
