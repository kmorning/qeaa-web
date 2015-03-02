class MedallionsController < ApplicationController
  before_filter :load_group, :authenticate_account!
  skip_before_filter :authenticate_account! , :only => :index
  after_action :verify_authorized, :except => :index

  def index
    @medallions = @group.present? ? @group.medallions : Medallion.all
  end

  def new
    authorize Medallion
    @medallion = Medallion.new
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

  private
  def load_group
    @group = Group.find(params[:group_id]) if params[:group_id].present?
  end

  def secure_params
    params.require(:medallion).permit(:meeting_id, :member_id, :years, :date_str)
  end
end
