class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(secure_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message.'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  private
  # TODO: add member id for email lookup.
  def secure_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end

