require "administrate/base_dashboard"

class MeetingDashboard < Administrate::BaseDashboard

  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  def attribute_types
    {
      id: :integer,
      group_id: :integer,
      name: :string,
      facility: :string,
      street: :string,
      city: :string,
      weekday: :integer,
      time: :time,
      category: :integer,
      format: :integer,
      accessible: :boolean,
      notice: :text,
      start_date: :date,
      end_date: :date,
      frequency: :integer,
      created_at: :datetime,
      updated_at: :datetime,
      province: :integer,
      latitude: :float,
      longitude: :float,
      postal_code: :string,
      group: :belongs_to,
    }
  end

  # This method returns an array of attributes
  # that will be displayed on the model's index page.
  def table_attributes
    attributes
  end

  # This method returns an array of attributes
  # that will be displayed on the model's show page
  def show_page_attributes
    attributes
  end

  # This method returns an array of attributes
  # that will be displayed on the model's form pages (`new` and `edit`)
  def form_attributes
    attributes - read_only_attributes
  end

  private

  def attributes
    [
      :id,
      :group_id,
      :name,
      :facility,
      :street,
      :city,
      :weekday,
      :time,
      :category,
      :format,
      :accessible,
      :notice,
      :start_date,
      :end_date,
      :frequency,
      :created_at,
      :updated_at,
      :province,
      :latitude,
      :longitude,
      :postal_code,
      :group,
    ]
  end

  def read_only_attributes
    [
      :id,
      :created_at,
      :updated_at,
    ]
  end
end
