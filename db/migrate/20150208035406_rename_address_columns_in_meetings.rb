class RenameAddressColumnsInMeetings < ActiveRecord::Migration
  def change
    rename_column :meetings, :address_facility, :facility
    rename_column :meetings, :address_street, :street
    rename_column :meetings, :address_city, :city
  end
end
