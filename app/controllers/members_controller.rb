class MembersController < ApplicationController
  def new
    @member = Member.new
    @member.member_emails.build
  end

  def create
    @member = Member.new(secure_params)

    if @member.save
      redirect_to @member
    else
      render 'new'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  private
  def secure_params
    params.require(:member).permit(:first_name, :last_initial, :group_id,
                                  :phone, :birthday,
                                  member_emails_attributes: [:email])
  end

end
