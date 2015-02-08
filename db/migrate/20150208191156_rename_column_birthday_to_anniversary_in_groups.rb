class RenameColumnBirthdayToAnniversaryInGroups < ActiveRecord::Migration
  def change
    rename_column :groups, :birthday, :anniversary
  end
end
