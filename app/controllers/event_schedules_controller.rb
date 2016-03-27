class EventSchedulesController < ApplicationController
  expose(:event_schedules){ EventSchedule.all }
  expose(:event_schedule, attributes: :event_schedule_params)#{

  def create
    if params[:event_schedule][:from_date].empty?
      params[:event_schedule][:from_date] = Date.today
    end
    if params[:event_schedule][:to_date].empty?
      params[:event_schedule][:to_date] = Date.today
    end

    #FIXME: how to handle empty time if it ever can happen?
    #if params[:event_schedule][:is_all_day] == '0'
    #  if params[:event_schedule][:from_time].empty?
    #    params[:event_schedule][:from_time] = Time.now.beginning_of_day
    #  end
    #  if params[:event_schedule][:to_time].empty?
    #    params[:event_schedule][:to_time] = Time.now.end_of_day
    #  end
    #end

    event_schedule.schedule = event_schedule.create_schedule
    if event_schedule.save
      flash[:notice] = 'Event Schedule Created'
      redirect_to root_path
    else
      render :new
    end
  end
  def update
    event_schedule.schedule = event_schedule.create_schedule
    if event_schedule.save
      flash[:notice] = 'Event Schedule Updated'
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    event_schedule.destroy
    redirect_to event_schedules_path
  end

  private
  def event_schedule_params
    params.require(:event_schedule).permit(:from_date, :from_time, :from_hour,
                                           :from_min, :to_date, :to_hour,
                                           :to_min, :to_time, 
                                           :is_all_day, :repeat_ends,
                                            :repeat_ends_on, :repeats,
                                            :repeats_every_n_days,
                                            :repeats_every_n_weeks,
                                            {repeats_weekly_each_days_of_the_week: []},
                                            :repeats_every_n_months,
                                            :repeats_monthly,
                                            :repeats_monthly_each_days_of_the_month,
                                            :repeats_monthly_on_days_of_the_week,
                                            :repeats_monthly_on_ordinals,
                                            :repeats_every_n_years,
                                            :repeats_yearly_each_months_of_the_year,
                                            :repeats_yearly_on,
                                            :repeats_yearly_on_days_of_the_week,
                                            :repeats_yearly_on_ordinals,
                                            :name, :description)
  end
end
