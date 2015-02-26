class AddDateToMedallions < ActiveRecord::Migration
  def change
    add_column :medallions, :date, :time
  end
end
