Given /^a valid user$/ do
  @user = User.create!({
             :email => "demo@gmail.com",
             :password => "12345678",
             :password_confirmation => "12345678"
           })
end

Given /^a logged in user$/ do
  Given "a valid user"
  visit signin_url
  fill_in "Email", :with => "demo@gmail.com"
  fill_in "Password", :with => "12345678"
  click_button "Sign in"
end