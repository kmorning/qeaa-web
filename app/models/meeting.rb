class Meeting < ActiveRecord::Base
  belongs_to :group, inverse_of: :meetings
  
  enum type: [:open, :closed]

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

  validates_presence_of :facility
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :weekday
  validates_presence_of :type
  validates_presence_of :format

end
