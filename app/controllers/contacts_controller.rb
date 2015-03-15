class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    if params[:recipient].present?
      @contact.recipient = params[:recipient]
      # Don't allow arbitrary recipient parameter
      redirect_to page_path('contact') unless @contact.recipient_valid?
    else
      @contact.recipient = "webmaster"
    end
  end

  def create
    @contact = Contact.new(secure_params)
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message.'
      redirect_to root_path
    else
      flash[:error] = 'Cannot send message.'
      render :new
    end
  end

  private
  # TODO: add member id for email lookup.
  def secure_params
    params.require(:contact).permit(:recipient, :name, :email, :subject_str, :message, :nickname)
  end
end

