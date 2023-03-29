class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      redirect_to action: :sent
    else
      flash.now[:error] = "Le message n'a pas pu être envoyé"
      render :new, status: :unprocessable_entity
    end
  end

  def sent
  end

  private

  def contact_params
    params.require(:contact).permit(:last_name, :first_name, :subject, :email, :message)
  end
end
