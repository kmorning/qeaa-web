require "administrate/base_dashboard"

class MeetingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    group: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    facility: Field::String,
    street: Field::String,
    city: Field::String,
    weekday: Field::String.with_options(searchable: false),
    time: Field::Time,
    category: Field::String.with_options(searchable: false),
    format: Field::String.with_options(searchable: false),
    accessible: Field::Boolean,
    notice: Field::Text,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    frequency: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    province: Field::String.with_options(searchable: false),
    latitude: Field::Number.with_options(decimals: 2),
    longitude: Field::Number.with_options(decimals: 2),
    postal_code: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :group,
    :id,
    :name,
    :facility,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :group,
    :id,
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
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :group,
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
    :province,
    :latitude,
    :longitude,
    :postal_code,
  ].freeze

  # Overwrite this method to customize how meetings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(meeting)
  #   "Meeting ##{meeting.id}"
  # end
end
