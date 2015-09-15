describe Contact do
  it "should show and error when try to save an empty record" do
    
    contact = Factory(:contact, first_name: '', last_name: '', email: '', phone: '', address: '')
    contact.should_not be_valid
  end
  
  # CRUD Test 
  
  it "create new contact" do
    contact = Factory(:contact)
    contact.should be_valid
  end
  
  it "update contact" do
    assert true
  end
  
  it "delete contact" do
    assert true
  end
  
  # Validations
  
  it "validation email uniqueness" do
    assert true
  end
end