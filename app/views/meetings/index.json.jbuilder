json.meetings @meetings do |meeting|
  json.(meeting, :name)
  json.set! :slug, meeting.id
  json.set! :day, meeting[:weekday]
  json.set! :time, meeting.time.strftime("%H:%M")
  json.set! :location, meeting.facility
  json.set! :notes, meeting.notice
end
