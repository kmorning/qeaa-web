class AddTempClosureToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :temp_closure, :boolean, default: false
  end
end
