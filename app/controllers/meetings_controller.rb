class MeetingsController < ApplicationController
  before_filter :authenticate_account!
  skip_before_filter :authenticate_account! , :only => [:index, :show]
  after_action :verify_authorized, :except => [:index, :show]

  def new
    authorize Meeting
    @meeting = Meeting.new
    @meeting.province = :on
  end

  def edit
    @meeting = Meeting.find(params[:id])
    authorize @meeting
  end

  def create
    authorize Meeting
    @meeting = Meeting.new(secure_params)

    @meeting.start_date = DateTime.now
    if @meeting.group_id? and not @meeting.name?
      @meeting.name = @meeting.group.name
    end

    if @meeting.save
      redirect_to @meeting
    else
      render 'new'
    end
  end

  def update
    @meeting = Meeting.find(params[:id])
    authorize @meeting

    if @meeting.update(secure_update_params)
      redirect_to @meeting
    else
      render 'edit'
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    authorize @meeting

    @meeting.destroy

    redirect_to meetings_path
  end

  def index
    @meetings = Meeting.order(:weekday, :time).page params[:page]
    @meetings = Meeting.send(params[:scope]).order(:weekday, :time).page params[:page] if params[:scope].present?
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private
  def secure_params
    params.require(:meeting).permit(:group_id, :name, :facility, :street, :city,
                                    :province, :postal_code, :weekday, 
                                    :time_str, :category, :format, :accessible,
                                    :notice, :frequency)
  end

  def secure_update_params
    params.require(:meeting).permit(:group_id, :name, :facility, :street, :city,
                                    :province, :postal_code, :weekday,
                                    :time_str, :category, :format, :accessible,
                                    :notice, :frequency)
  end
end
