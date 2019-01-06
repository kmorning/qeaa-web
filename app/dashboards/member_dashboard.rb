require "administrate/base_dashboard"

class MemberDashboard < Administrate::BaseDashboard

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
      first_name: :string,
      last_initial: :string,
      phone: :string,
      birthday: :date,
      created_at: :datetime,
      updated_at: :datetime,
      roles: :has_many,
      member_emails: :has_many,
      account: :belongs_to,
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
      :first_name,
      :last_initial,
      :phone,
      :birthday,
      :created_at,
      :updated_at,
      :roles,
      :member_emails,
      :account,
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
