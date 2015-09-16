require "rails_helper"
require 'pp'

describe Contact do
  it "should show an error when try to save an empty record" do
    contact = FactoryGirl.build(:contact, first_name: '', last_name: '', email: '', phone: '', address: '')
    contact.should_not be_valid
  end
  
  #==========================
  #        CRUD Test 
  #==========================
  
  it "should be valid create new contact with valid data" do
    pp "should be valid create new contact with valid data"
    contact = FactoryGirl.build(:contact)
    contact.should be_valid
  end
  
  it "show return true when update a contact with valid data" do
    pp "show return true when update a contact with valid data"
    contact = FactoryGirl.build(:contact)
    contact.first_name = "Charles"
    contact.last_name = "Smith"
    contact.address = "5th Street, 13 Av, Central Park"
    expect(contact.save).to eq(true)
  end
  
  it "should show an error whe try to update contact with worng data" do
    contact = FactoryGirl.build(:contact)
    contact.email = "Carlos"
    expect(contact.save).to eq(false)
  end
  
  it "delete contact" do 
    contact = FactoryGirl.build(:contact)
    contact.destroy
    assert true
  end
  
  it "should create an identicon when a contact whithout photo is create" do 
    contact = FactoryGirl.create(:contact) 
    pp "Verifing file creation : #{Rails.root}/app/assets/images/#{contact.id}_identicon.png"
    File.exist?("#{Rails.root}/app/assets/images/#{contact.id}_identicon.png").should be true
  end
 
  # Validations
  
  it "should validate email uniqueness" do 
    previus_contact = FactoryGirl.create(:example_contact)
    duplicate_contact = FactoryGirl.build(:duplicate_contact)
    duplicate_contact.should_not be_valid
  end
  
  it "should validate email format" do 
    wrong_mail_contact = FactoryGirl.build(:contact, email: 'wrong_mail@mail') 
    wrong_mail_contact.should_not be_valid
  end
  
end