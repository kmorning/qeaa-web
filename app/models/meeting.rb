class Meeting < ActiveRecord::Base
  include Addressable

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

  # Class variables for JSON feed
  @@category_types = ["O", "C"]
  @@format_types = ["D", "SP", "BE", "ST", "TR", "B", "BUS", "BUS", "BUS", "GR", nil]

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
  #validates_as_postal_code :postal_code, country: "CA", multiline: true, allow_blank: true
  validates_format_of :postal_code, with: /^\s*[a-ceghj-npr-tvxy]\d[a-ceghj-npr-tv-z](\s)?\d[a-ceghj-npr-tv-z]\d\s*$/i, multiline: true, allow_blank: true
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

  def address
    self.facility + ", " + self.street
  end

  def notes
    if  self.accessible?
      note_str = "(WA)"
      unless self.notice.blank?
        note_str = self.notice + ", " + note_str
      end
    else
      note_str = self.notice
    end
    note_str
  end

  def types_str
    self.types.join(',')
  end

  def description
    if self.format.present?
      self.category.titleize + " " + self.format.titleize
    else
      self.category.titleize
    end
  end

  # JSON feed for meeting guide app
  def updated
    updated_at.utc.strftime("%F %T") if updated_at
  end

  def types
    t = Array.new()
    t << category_type if category_type
    t << format_type if format_type
    t << "X" if self.accessible?
    t << "TC" if self.temp_closure?
    t
  end

  private
  def category_type
    @@category_types[self[:category]] if self.category
  end

  def format_type
    @@format_types[self[:format]] if self.format
  end

end
