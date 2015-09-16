class ContactsController < ApplicationController
  
  before_action :authenticate_user! # Validate user authentication
  
  respond_to :html, :js
  
  # Main Action
  def index
    @contacts = Contact.order(:last_name).filter_by_user(current_user)
    @query = "#{params[:query]}%"
    @contacts = @contacts.where("first_name LIKE ? OR last_name LIKE ? OR address LIKE ? OR phone LIKE ? OR email LIKE ?", 
                                 @query, @query, @query, @query, @query) if params[:query] != nil
  end

  # New contact method
  def new
    @contact = Contact.new
  end
  
  # New callback method
  def create
    contact = Contact.new(contact_params)
    if contact.save
      @contacts = Contact.order(:last_name).filter_by_user(current_user)
    else
      @contact = contact
    end
  end

  # Edit contact method
  def edit
    @contact = Contact.find(params[:id])
  end
  
  # Remove contact method
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy!
    @contacts = Contact.order(:last_name).filter_by_user(current_user)
  end
  
  # Edit callback method
  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(contact_params)
      @contacts = Contact.order(:last_name).filter_by_user(current_user)
    else
      @contact = contact
    end
  end
  
  # Strong parameters section
  private
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :avatar, :address, :phone, :email, :user_id)
    end
end
