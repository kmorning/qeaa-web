class AddTypeToEventSchedule < ActiveRecord::Migration
  def change
    add_column :event_schedules, :type, :string
  end
end
