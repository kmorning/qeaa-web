class Meeting < ActiveRecord::Base
  belongs_to :group, inverse_of: :meetings
  
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

  # TODO: Validate that no other meeting for a given group is
  # within the same day and time.
  # This validation won't work because time has date as well.
  #validates :group_id, uniqueness: {scope: :weekday, :time}
  validates_presence_of :facility
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :weekday
  validates_presence_of :category
  validates_presence_of :format

end
