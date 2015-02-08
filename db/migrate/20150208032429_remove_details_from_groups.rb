class RemoveDetailsFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :address_building, :string
    remove_column :groups, :address_street, :string
    remove_column :groups, :address_city, :string
    remove_column :groups, :weekday, :integer
    remove_column :groups, :time, :time
    remove_column :groups, :closed, :boolean
    remove_column :groups, :accessible, :boolean
  end
end
