class CreateMedallions < ActiveRecord::Migration
  def change
    create_table :medallions do |t|
      t.belongs_to :meeting, index: true
      t.belongs_to :member, index: true

      t.timestamps null: false
    end
    add_foreign_key :medallions, :meetings
    add_foreign_key :medallions, :members
  end
end
