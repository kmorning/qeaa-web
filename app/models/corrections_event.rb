class CorrectionsEvent < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  extend Rails.application.routes.url_helpers

  belongs_to :event_schedule

  attr_accessor :color, :url, :textColor

  after_save do
    event_schedule.schedule.add_exception_time(start)
    event_schedule.save
  end

  def self.occurrences_between(begin_date,end_date)
    # Generate scheduled events that are not assigned and therefore not in db
    # Using Squeel
    # line 1 = Event doesn't repeat, but ends in window
    # line 2 = Event doesn't repeat, but starts in window
    # line 3 = Event doesn't repeat, but starts before and ends after
    # line 4 = Event starts before our end date and repeats until a certain point of time, and that point of time after our begin date
    # line 5 = Event repeats indefinitely, then all we care about is that it has started at somepoint in the last

    results = CorrectionsSchedule.where{
      (
        (repeats == 'never') &
        (from >= begin_date) &
        (from <= end_date)
      ) | (
         (repeats == 'never') &
         (to >= begin_date) &
         (to <= end_date)
      ) | (
         (repeats == 'never') &
         (from <= begin_date) &
         (to >= end_date)
      ) | (
         (repeats != 'never') &
         (from <= end_date) &
         (repeat_ends == 'on') &
         (repeat_ends_on >= begin_date)
      ) | (
         (repeats != 'never') &
         (repeat_ends == 'never') &
         (from <= end_date)
      )
    }

    vevents = results.map { |event|
      event.schedule.occurrences_between(begin_date,end_date).map { |date|
        i = CorrectionsEvent.new()
        i.title = event.name
        # FIXME: get color form schedule
        i.color = 'lightblue'
        #i.color = event.calendar.color
        #i.url = Rails.application.routes.url_helpers.corrections_schedule_path(event)
        i.from = date
        i.to = date + event.duration.seconds
        i.allDay = event.is_all_day
        i.event_schedule_id = event.id
        i.textColor = 'black'
        i.url = Rails.application.routes.url_helpers.new_corrections_event_path(corrections_event: {title: i.title, from: i.from, to: i.to, allDay: i.allDay, event_schedule_id: i.event_schedule_id})

        i
      }
    }
    results = CorrectionsEvent.where{
      (
        (from >= begin_date) &
        (from <= end_date)
      ) | (
        (to >= begin_date) &
        (to <= end_date)
      ) | (
        (from <= begin_date) &
        (to >= end_date)
      )
    }

    events = results.map { |event|
      event.color = 'blue'
      event.textColor = 'black'
      event.url = Rails.application.routes.url_helpers.corrections_events_path(event.id)
      event
    }

    vevents.push(*events).flatten.sort! {|x,y| x.to <=> y.to }
    #vevents.flatten.sort! {|x,y| x.to <=> y.to }
  end

  # Support my "virtual" attributes when converting to json
  def as_json options=nil
    options ||= {}
    # TODO: exclude attributes
    # options[:except] = ((options[:except] || []) + [:id])
    options[:methods] = ((options[:methods] || []) + [:color, :url, :textColor])
    super(options).tap { |hash| 
      hash["start"] = hash.delete "from" 
      hash["end"] = hash.delete "to"
    }
  end

end
