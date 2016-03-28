class EventSchedulesController < ApplicationController
  expose(:event_schedules){ type_class.all }
  #expose(:event_schedule, attributes: :event_schedule_params)
  expose(:event_schedule) {
    if params[:action] == 'new'
      type_class.new
    elsif params[:action] == 'create'
      #if params[:event_schedule][:type]
      #  params[:event_schedule][:type].constantize.new(event_schedule_params)
      #else
      EventSchedule.new(event_schedule_params)
      #end
    elsif params[:action] == 'show' || params[:action] == 'edit'
      EventSchedule.find(params[:id])
    end
  }

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
    event_schedule = EventSchedule.find(params[:id])
    event_schedule.assign_attributes(event_schedule_params)
    event_schedule.schedule = event_schedule.create_schedule
    if event_schedule.save
      flash[:notice] = 'Event Schedule Updated'
      type = event_schedule.type ? event_schedule.type : 'EventSchedule'
      redirect_to controller: 'event_schedules', type: type
    else
      render :edit
    end
  end
  def destroy
    event_schedule = EventSchedule.find(params[:id])
    type = event_schedule.type ? event_schedule.type : 'EventSchedule'
    event_schedule.destroy
    #redirect_to event_schedules_path
    redirect_to controller: 'event_schedules', type: type
  end

  private
  def type_class
    type = params[:type] ? params[:type] : 'EventSchedule'
    type.constantize
  end

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
                                            {repeats_monthly_each_days_of_the_month: []},
                                            {repeats_monthly_on_days_of_the_week: []},
                                            {repeats_monthly_on_ordinals: []},
                                            :repeats_every_n_years,
                                            {repeats_yearly_each_months_of_the_year: []},
                                            :repeats_yearly_on,
                                            {repeats_yearly_on_days_of_the_week: []},
                                            {repeats_yearly_on_ordinals: []},
                                            :name, :description, :type)
  end
end
