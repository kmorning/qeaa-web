require "administrate/base_dashboard"

class MedallionDashboard < Administrate::BaseDashboard

  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  def attribute_types
    {
      id: :integer,
      meeting_id: :integer,
      member_id: :integer,
      created_at: :datetime,
      updated_at: :datetime,
      years: :integer,
      date: :datetime,
      event: :belongs_to,
      group: :belongs_to,
      meeting: :belongs_to,
      member: :belongs_to,
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
      :meeting_id,
      :member_id,
      :created_at,
      :updated_at,
      :years,
      :date,
      :event,
      :group,
      :meeting,
      :member,
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
