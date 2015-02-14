class GroupsController < ApplicationController
  before_filter :authenticate_account!
  skip_before_filter :authenticate_account! , :only => [:index, :show]
  def new
   # Temporay authorization without pundit
    unless current_member.has_role? :admin
      redirect_to :root, :alert => "Access denied."
    end
    @group = Group.new
  end

  def create
    # Temporay authorization without pundit
    unless current_member.has_role? :admin
      redirect_to :root, :alert => "Access denied."
    end
    # Just to see what the parameters look like.
    #render plain: params[:group].inspect
    @group = Group.new(secure_params)

    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  private
  def secure_params
    params.require(:group).permit(:name)
  end

end
