class CorrectionsEventsController < ApplicationController
  def index
    @events = CorrectionsEvent.occurrences_between(Date.today - 1.year,Date.today + 1.year)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events.to_json(:methods => [:color]) }
    end
  end
end
