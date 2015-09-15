require 'test_helper'

class ContactTest < ActiveSupport::TestCase 
  
  test "validation email uniqueness" do
    
  end
  
  test "try to save empty record" do
    contact = Contact.new
    assert_not contac.save, "Saved the contact without data"
  end
  
end
