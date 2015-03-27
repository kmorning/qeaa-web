class AddPostalCodeToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :postal_code, :string
  end
end
