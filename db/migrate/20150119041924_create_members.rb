class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.belongs_to :group, index: true
      t.string :first_name
      t.string :last_initial
      t.string :phone
      t.string :email
      t.date :birthday

      t.timestamps null: false
    end
  end
end
