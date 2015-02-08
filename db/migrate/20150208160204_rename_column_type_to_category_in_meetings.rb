class RenameColumnTypeToCategoryInMeetings < ActiveRecord::Migration
  def change
    rename_column :meetings, :type, :category
  end
end
