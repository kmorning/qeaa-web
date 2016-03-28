class EventScheduleInstance
  include Rails.application.routes.url_helpers
  extend Rails.application.routes.url_helpers
  include ActiveModel::AttributeMethods
  delegate :url_helpers, to: 'Rails.application.routes'
  attr_accessor :title, :start, :end, :allDay, :event_id, :color, :url, :background_color, :textColor

  def self.occurrences_between(begin_date,end_date )
    # Using Squeel
    # line 1 = Event doesn't repeat, but ends in window
    # line 2 = Event doesn't repeat, but starts in window
    # line 2 = Event doesn't repeat, but starts before and ends after
    # line 4 = Event starts before our end date and repeats until a certain point of time, and that point of time after our begin date
    # line 5 = Event repeats indefinitely, then all we care about is that it has started at somepoint in the last
    if !calendar_ids.empty?
      results = CalendarEvent.where{
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
      }.where(:calendar_id => calendar_ids.split(',').reject{ |c| c.empty? }.uniq)
    else
     results = CalendarEvent.where{
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
    end
    results.map { |event|
      event.schedule.occurrences_between(begin_date,end_date).map { |date|
        i = CalendarEventInstance.new()
        i.title = event.name
        i.color = event.calendar.color
        i.url = Rails.application.routes.url_helpers.calendar_event_path(event)
        i.start = date
        i.end = date + event.duration.seconds
        i.allDay = event.is_all_day
        i.event_id = event.id
        i.textColor = 'black'
        i
      }
    }.flatten.sort! {|x,y| x.start <=> y.start }
  end

end
