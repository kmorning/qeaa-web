class CorrectionsSchedule < EventSchedule
  has_many :events, foreign_key: "event_schedule_id", class_name: "CorrectionsEvent"

  #def events
  #  corrections_events
  #end
end
