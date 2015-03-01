class AddYearsToMedallions < ActiveRecord::Migration
  def change
    add_column :medallions, :years, :integer
  end
end
