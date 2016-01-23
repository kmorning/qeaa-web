class GroupsController < ApplicationController
  before_filter :authenticate_account!
  #skip_before_filter :authenticate_account! , :only => [:index]
  after_action :verify_authorized #, :except => :index
  def new
    authorize Group
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
    authorize @group
  end

  def create
    authorize Group
    # Just to see what the parameters look like.
    #render plain: params[:group].inspect
    @group = Group.new(secure_params)

    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])
    authorize @group

    if @group.update(secure_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    authorize @group

    @group.destroy

    redirect_to groups_path
  end

  def index
    authorize Group
    #@groups = Group.all
    @groups = Group.order(:name)
  end

  def show
    @group = Group.find(params[:id])
    authorize @group
  end

  private
  def secure_params
    params.require(:group).permit(:name)
  end

end
