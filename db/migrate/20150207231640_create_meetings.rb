class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.belongs_to :group, index: true
      t.string :address_facility
      t.string :address_street
      t.string :address_city
      t.integer :weekday
      t.time :time
      t.integer :type
      t.integer :format
      t.boolean :accessible
      t.text :notice
      t.date :start_date
      t.date :end_date
      t.integer :frequency, :default => 0

      t.timestamps null: false
    end
  end
end
