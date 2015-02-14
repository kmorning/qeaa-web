class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_member
  
  def current_member
    if current_account
      current_account.member
    else
      nil
    end
  end

  def pundit_user
    current_member
  end

end
