require 'spec_helper'
require 'pp'

describe User do  
  
  it "should can sign in a new user" do
    user = FactoryGirl.build(:demo_user)  
    sign_in :user, user
  end
  
end