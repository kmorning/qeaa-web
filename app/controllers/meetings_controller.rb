class MeetingsController < ApplicationController
  before_filter :authenticate_account!
  skip_before_filter :authenticate_account! , :only => [:index, :show]
  after_action :verify_authorized, :except => [:index, :show]

  def new
    authorize Meeting
    @meeting = Meeting.new
  end

  def create
    authorize Meeting
    @meeting = Meeting.new(secure_params)

    @meeting.start_date = DateTime.now
    if @meeting.group_id? and @meeting.name.nil?
      @meeting.name = @meeting.group.name
    end

    if @meeting.save
      redirect_to @meeting
    else
      render 'new'
    end
  end

  def index
    @meetings = Meeting.order(:weekday, :time)
    @meetings = Meeting.send(params[:scope]).order(:weekday, :time) if params[:scope].present?
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private
  def secure_params
    params.require(:meeting).permit(:group_id, :name, :facility, :street, :city,
                                    :weekday, :time, :category, :format, 
                                    :accessible, :notice, :frequency)
  end
end
