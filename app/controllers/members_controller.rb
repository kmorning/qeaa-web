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
      apply_roles
      redirect_to @member
    else
      render 'edit'
    end
  end

  def index
    authorize Member
    #@members = Member.order(:first_name)
    @members = Member.includes(:group).order("groups.name", :first_name)
    @members = Member.where(["group_id = :g", {g: params[:scope]}]).order(:first_name) if params[:scope].present?
  end

  def destroy
    @member = Member.find(params[:id])
    authorize @member
    @member.destroy
    redirect_to members_path
  end

  def show
    @member = Member.find(params[:id])
    authorize @member
  end

  def reset_all_viewable
    authorize Member
    start_date = Date.parse(Time.zone.now.to_s)
    end_date = start_date.advance(days: +45)
    displayed_members = Member.find_birthdays_for(start_date, end_date).with_role(:viewable).sort_by{ |m| [m.birthday.month,     m.birthday.day]  }
    members = Member.with_role :viewable
    members.each do |member|
      member.remove_role :viewable
    end
    displayed_members.each do |member|
      member.add_role :viewable
    end
    redirect_to action: 'index'
  end

  private
  def secure_params
    params.require(:member).permit(:first_name, :last_initial, :group_id,
                                  :phone, :birthday_str,
                                  member_emails_attributes: [:email])
  end

  # This should disallow members from changing group or name
  # TODO:  Allow admin to change group or name and change/add role.
  def secure_update_params
    params.require(:member).permit(:first_name, :last_initial, :phone, 
                                   :birthday_str, 
                                   member_emails_attributes: [:id, :email])
  end

  def apply_roles
    if params[:viewable] == "1"
      @member.grant(:viewable)
    elsif params[:viewable] == "0"
      @member.remove_role(:viewable)
    end
  end



end
