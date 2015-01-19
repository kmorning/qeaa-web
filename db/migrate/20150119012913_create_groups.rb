class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :address_building
      t.string :address_street
      t.string :address_city
      t.integer :weekday
      t.time :time
      t.boolean :closed
      t.boolean :accessible

      t.timestamps null: false
    end
  end
end
