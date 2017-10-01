json.meetings @meetings do |meeting|
  json.(meeting, :name)
  json.set! :slug, meeting.id
  json.set! :day, meeting[:weekday]
  json.set! :time, meeting.time.strftime("%H:%M")
  json.set! :location, meeting.facility
  json.set! :notes, meeting.notice
  json.(meeting, :types, :updated)
  json.set! :address, meeting.street
  json.(meeting, :city, :postal_code)
  json.set! :country, "CA"
  json.(meeting, :longitude, :latitude)
end
