class RegistrationsController < Devise::RegistrationsController

  def create
    email = params[:email]
    if MemberEmail.find_by email: email
      super
    else
      redirect_to root_path, :notice => 'Member email does not exist'
    end
  end

end
