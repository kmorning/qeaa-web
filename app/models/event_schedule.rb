class EventSchedule < ActiveRecord::Base
  include Repeatable

  extend TimeSplitter::Accessors
  split_accessor :from, :to, default: -> { Time.zone.now }

  serialize :schedule, IceCube::Schedule

  # TODO:  do we need to belong to a calendar...I don't think so.
  #belongs_to :calendar

  validates_presence_of :name
  #validates_presence_of :calendar_id
  validates_presence_of :from
  validates_presence_of :to

# TODO: see if this is a better way to handle url helplers
  def self.inherited(child)
    child.instance_eval do
      def model_name
        EventSchedule.model_name
      end
    end
    super
  end

  def color
    if calendar.color
      calendar.color
    else
      'lightblue'
    end
  end

  def not_all_day?
    if is_all_day
      return false
    else
      return true
    end
  end

end
