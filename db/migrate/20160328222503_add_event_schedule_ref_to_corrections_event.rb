class AddEventScheduleRefToCorrectionsEvent < ActiveRecord::Migration
  def change
    add_reference :corrections_events, :event_schedule, index: true
    add_foreign_key :corrections_events, :event_schedules
  end
end
