class MedallionsController < ApplicationController
  before_filter :load_group

  def index
    @medallions = @group.present? ? @group.medallions : Medallion.all
  end

  def new
    @medallion = Medallion.new
    #@event = @group.events.build(instance: @medallion)
  end

  def create
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
