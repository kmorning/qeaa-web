class AddVideoConferenceUrlToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :video_conference_url, :string
  end
end
