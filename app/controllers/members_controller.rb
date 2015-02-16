class MembersController < ApplicationController
  before_filter :authenticate_account!
  after_action :verify_authorized

  def new
    authorize Member
    @member = Member.new
    @member.member_emails.build
  end

  def edit
    @member = Member.find(params[:id])
    authorize @member
  end

  def create
    authorize Member
    @member = Member.new(secure_params)

    if @member.save
      # Add group member role - is this redundant since member
      # already has group_id?
      # @member.add_role :member, @member.group
      redirect_to @member
    else
      render 'new'
    end
  end

  def update
    @member = Member.find(params[:id])
    authorize @member

    if @member.update(secure_update_params)
      redirect_to @member
    else
      render 'edit'
    end
  end

  def show
    @member = Member.find(params[:id])
    authorize @member
  end

  private
  def secure_params
    params.require(:member).permit(:first_name, :last_initial, :group_id,
                                  :phone, :birthday,
                                  member_emails_attributes: [:email])
  end

  # This should disallow members from changing group or name
  # TODO:  Allow admin to change group or name and change/add role.
  def secure_update_params
    params.require(:member).permit(:phone, :birthday,
                                  member_emails_attributes: [:id, :email])
  end


end
