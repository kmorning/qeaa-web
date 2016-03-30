class CorrectionsEventsController < ApplicationController
  def index
    @events = CorrectionsEvent.occurrences_between(Date.today - 1.year,Date.today + 1.year)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events.to_json(:methods => [:color]) }
    end
  end

  def new
    if params[:event]
      @event = CorrectionsEvent.new(event_params)
    else
      @event = CorrectionsEvent.new
    end
  end

  def create
    @event = CorrectionsEvent.new(event_params)

    if @event.save
      redirect_to corrections_event_path
    else
      render new
    end
  end

  private
  def event_params
    params.require(:event).permit(:title, :start, :end, :allDay, :event_schedule_id)
  end
end
