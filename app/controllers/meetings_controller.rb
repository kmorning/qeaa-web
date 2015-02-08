class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(secure_params)

    @meeting.start_date = DateTime.now

    if @meeting.save
      redirect_to @meeting
    else
      render 'new'
    end
  end

  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private
  def secure_params
    params.require(:meeting).permit(:group_id, :facility, :street, :city,
                                    :weekday, :time, :category, :format, 
                                    :accessible, :notice, :frequency)
  end
end
