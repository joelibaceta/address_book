module ControllerUser

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:demo_user) 
      sign_in user
    end
  end
end