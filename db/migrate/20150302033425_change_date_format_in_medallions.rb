class ChangeDateFormatInMedallions < ActiveRecord::Migration
  def up
    remove_column :medallions, :date
    add_column :medallions, :date, :datetime
  end

  def down
    remove_column :medallions, :date
    add_column :medallions, :date, :time
  end
end
