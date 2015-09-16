require "rails_helper"
require 'pp'

describe User do
  #@request.env["devise.mapping"] = Devise.mappings[:user]
  #admin = FactoryGirl.create(:admin)
  #      sign_in :user, admin
  it "should can sign in a new user" do
    user = FactoryGirl.build(:demo_user)  
    sign_in :user, user
  end
  
end