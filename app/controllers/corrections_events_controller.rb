class CorrectionsEventsController < ApplicationController
  def index
    @corrections_events = CorrectionsEvent.occurrences_between(Date.today - 1.year,Date.today + 1.year)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @corrections_events.to_json(:methods => [:color]) }
    end
  end

  def new
    if params[:corrections_event]
      @corrections_event = CorrectionsEvent.new(event_params)
    else
      @corrections_event = CorrectionsEvent.new
    end
  end

  def create
    @corrections_event = CorrectionsEvent.new(event_params)

    if @corrections_event.save
      redirect_to corrections_event_path
    else
      render new
    end
  end

  private
  def event_params
    params.require(:corrections_event).permit(:title, :start, :end, :allDay, :event_schedule_id)
  end
end
