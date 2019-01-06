require "administrate/base_dashboard"

class CorrectionsEventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    event_schedule: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    from: Field::DateTime,
    to: Field::DateTime,
    allDay: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :event_schedule,
    :id,
    :title,
    :from,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :event_schedule,
    :id,
    :title,
    :from,
    :to,
    :allDay,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :event_schedule,
    :title,
    :from,
    :to,
    :allDay,
  ].freeze

  # Overwrite this method to customize how corrections events are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(corrections_event)
  #   "CorrectionsEvent ##{corrections_event.id}"
  # end
end
