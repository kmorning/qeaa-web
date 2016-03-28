class CorrectionsSchedule < EventSchedule
  has_many :corrections_events

  def events
    corrections_events
  end
end
