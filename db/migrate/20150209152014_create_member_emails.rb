class CreateMemberEmails < ActiveRecord::Migration
  def change
    create_table :member_emails do |t|
      t.belongs_to :member, index: true
      t.string :email
      t.boolean :is_primary

      t.timestamps null: false
    end
  end
end
