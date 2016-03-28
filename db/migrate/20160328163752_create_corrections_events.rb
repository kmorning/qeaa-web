class CreateCorrectionsEvents < ActiveRecord::Migration
  def change
    create_table :corrections_events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.boolean :allDay

      t.timestamps null: false
    end
  end
end
