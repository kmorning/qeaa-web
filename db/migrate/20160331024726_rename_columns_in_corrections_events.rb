class RenameColumnsInCorrectionsEvents < ActiveRecord::Migration
  def change
    change_table :corrections_events do |t|
      t.rename :start, :from
      t.rename :end, :to
    end
  end
end
