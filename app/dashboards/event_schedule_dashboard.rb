require "administrate/base_dashboard"

class EventScheduleDashboard < Administrate::BaseDashboard

  # This method returns a hash
  # that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  def attribute_types
    {
      id: :integer,
      name: :string,
      description: :text,
      is_all_day: :boolean,
      from: :datetime,
      to: :datetime,
      schedule: :text,
      repeats: :string,
      repeats_every_n_days: :integer,
      repeats_every_n_weeks: :integer,
      repeats_weekly_each_days_of_the_week_mask: :integer,
      repeats_every_n_months: :integer,
      repeats_monthly: :integer,
      repeats_monthly_each_days_of_the_month_mask: :integer,
      repeats_monthly_on_ordinals_mask: :integer,
      repeats_monthly_on_days_of_the_week_mask: :integer,
      repeats_every_n_years: :integer,
      repeats_yearly_each_months_of_the_year_mask: :integer,
      repeats_yearly_on: :boolean,
      repeats_yearly_on_ordinals_mask: :integer,
      repeats_yearly_on_days_of_the_week_mask: :integer,
      repeat_ends: :string,
      repeat_ends_on: :date,
      created_at: :datetime,
      updated_at: :datetime,
      type: :string,
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
