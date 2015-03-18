class MedallionsController < ApplicationController
  before_filter :load_group, :authenticate_account!
  skip_before_filter :authenticate_account! , :only => :index
  after_action :verify_authorized, :except => :index

  def index
    #@medallions = @group.present? ? @group.medallions : Medallion.all
    if @group.present?
      authenticate_account!
      authorize Medallion
      @medallions = @group.medallions
    else
      start_date = DateTime.now
      end_date = start_date.advance(days: +60)
      @medallions = Medallion.where(date: start_date..end_date).order(:date)
    end
  end

  def show
    authorize Medallion
    @medallion = Medallion.find(params[:id])
  end


  def new
    authorize Medallion
    @medallion = Medallion.new
  end

  def edit
    @medallion = Medallion.find(params[:id])
    authorize @medallion
  end

  def create
    authorize Medallion
    @medallion = Medallion.new(secure_params)

    if @group.events.create(instance: @medallion)
      redirect_to @group
    else
      render 'new'
    end
  end

  def update
    @medallion = Medallion.find(params[:id])
    authorize @medallion

    if @medallion.update(secure_params)
      redirect_to @medallion
    else
      render 'edit'
    end
  end

  private
  def load_group
    @group = Group.find(params[:group_id]) if params[:group_id].present?
  end

  def secure_params
    params.require(:medallion).permit(:meeting_id, :member_id, :years, :date_str)
  end
end
