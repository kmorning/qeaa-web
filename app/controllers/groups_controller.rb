class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    # Just to see what the parameters look like.
    #render plain: params[:group].inspect
    @group = Group.new(secure_params)

    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def secure_params
    params.require(:group).permit(:name, :address_building, :address_street,
                                  :address_city, :weekday, :closed,
                                  :accessible)
  end

end
