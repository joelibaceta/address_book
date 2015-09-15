class ContactsController < ApplicationController
  respond_to :html, :js
  
  def index
    @contacts = Contact.order(:last_name)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def new
    @contact = Contact.new 
  end
  
  def create
    contact = Contact.new(contact_params)
    if contact.save
      @contacts = Contact.order(:last_name)
      
    else
      @contact = contact
    end
    
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def show
    @contact = Contact.find(params[:id])
  end
  
  def destroy
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
  end
  
  private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :avatar, :address, :phone, :email)
    end
end
