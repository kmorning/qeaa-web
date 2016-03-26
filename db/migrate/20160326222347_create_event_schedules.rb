class CreateEventSchedules < ActiveRecord::Migration
  def change
    create_table :event_schedules do |t|
      t.string   "name"
      t.text     "description"
      t.boolean  "is_all_day"
      t.datetime "from"
      t.datetime "to"
      t.text     "schedule"
      t.string   "repeats"
      t.integer  "repeats_every_n_days"
      t.integer  "repeats_every_n_weeks"
      t.integer  "repeats_weekly_each_days_of_the_week_mask"
      t.integer  "repeats_every_n_months"
      t.integer  "repeats_monthly"
      t.integer  "repeats_monthly_each_days_of_the_month_mask"
      t.integer  "repeats_monthly_on_ordinals_mask"
      t.integer  "repeats_monthly_on_days_of_the_week_mask"
      t.integer  "repeats_every_n_years"
      t.integer  "repeats_yearly_each_months_of_the_year_mask"
      t.boolean  "repeats_yearly_on"
      t.integer  "repeats_yearly_on_ordinals_mask"
      t.integer  "repeats_yearly_on_days_of_the_week_mask"
      t.string   "repeat_ends"
      t.date     "repeat_ends_on"      

      t.timestamps null: false
    end
  end
end
