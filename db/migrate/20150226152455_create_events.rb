class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :group, index: true
      t.belongs_to :instance, index: true

      t.timestamps null: false
    end
    add_foreign_key :events, :groups
    add_foreign_key :events, :instances
  end
end
