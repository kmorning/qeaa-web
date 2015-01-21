class Group < ActiveRecord::Base
  has_many :members, inverse_of: :group
  enum weekday: [:sunday, 
                 :monday, 
                 :tuesday, 
                 :wednesday, 
                 :thursday,
                 :friday,
                 :saturday]

  validates_presence_of :name
  validates_presence_of :address_building
  validates_presence_of :address_street
  validates_presence_of :address_city
  validates_presence_of :weekday
end
