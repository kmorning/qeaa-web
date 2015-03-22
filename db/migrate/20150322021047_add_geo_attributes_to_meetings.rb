class AddGeoAttributesToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :province, :integer
    add_column :meetings, :latitude, :float
    add_column :meetings, :longitude, :float
  end
end
