class RegistrationsController < Devise::RegistrationsController

  def create
    email = params[:account][:email]
    Rails.logger.debug "email = #{email}"
    if member_email = MemberEmail.find_by( email: email )
      super
      member_email.member.account = self.resource
    else
      redirect_to root_path, :notice => 'Member email does not exist'
    end
  end

end
