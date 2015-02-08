class AddBirthdayToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :birthday, :date
  end
end
