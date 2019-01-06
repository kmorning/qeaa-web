require "administrate/base_dashboard"

class EventScheduleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    is_all_day: Field::Boolean,
    from: Field::DateTime,
    to: Field::DateTime,
    schedule: Field::Text,
    repeats: Field::String,
    repeats_every_n_days: Field::Number,
    repeats_every_n_weeks: Field::Number,
    repeats_weekly_each_days_of_the_week_mask: Field::Number,
    repeats_every_n_months: Field::Number,
    repeats_monthly: Field::Number,
    repeats_monthly_each_days_of_the_month_mask: Field::Number,
    repeats_monthly_on_ordinals_mask: Field::Number,
    repeats_monthly_on_days_of_the_week_mask: Field::Number,
    repeats_every_n_years: Field::Number,
    repeats_yearly_each_months_of_the_year_mask: Field::Number,
    repeats_yearly_on: Field::Boolean,
    repeats_yearly_on_ordinals_mask: Field::Number,
    repeats_yearly_on_days_of_the_week_mask: Field::Number,
    repeat_ends: Field::String,
    repeat_ends_on: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    type: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :is_all_day,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :description,
    :is_all_day,
    :from,
    :to,
    :schedule,
    :repeats,
    :repeats_every_n_days,
    :repeats_every_n_weeks,
    :repeats_weekly_each_days_of_the_week_mask,
    :repeats_every_n_months,
    :repeats_monthly,
    :repeats_monthly_each_days_of_the_month_mask,
    :repeats_monthly_on_ordinals_mask,
    :repeats_monthly_on_days_of_the_week_mask,
    :repeats_every_n_years,
    :repeats_yearly_each_months_of_the_year_mask,
    :repeats_yearly_on,
    :repeats_yearly_on_ordinals_mask,
    :repeats_yearly_on_days_of_the_week_mask,
    :repeat_ends,
    :repeat_ends_on,
    :created_at,
    :updated_at,
    :type,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :description,
    :is_all_day,
    :from,
    :to,
    :schedule,
    :repeats,
    :repeats_every_n_days,
    :repeats_every_n_weeks,
    :repeats_weekly_each_days_of_the_week_mask,
    :repeats_every_n_months,
    :repeats_monthly,
    :repeats_monthly_each_days_of_the_month_mask,
    :repeats_monthly_on_ordinals_mask,
    :repeats_monthly_on_days_of_the_week_mask,
    :repeats_every_n_years,
    :repeats_yearly_each_months_of_the_year_mask,
    :repeats_yearly_on,
    :repeats_yearly_on_ordinals_mask,
    :repeats_yearly_on_days_of_the_week_mask,
    :repeat_ends,
    :repeat_ends_on,
    :type,
  ].freeze

  # Overwrite this method to customize how event schedules are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event_schedule)
  #   "EventSchedule ##{event_schedule.id}"
  # end
end
