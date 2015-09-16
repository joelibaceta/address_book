FactoryGirl.define do
  factory :user do |f|  
    sequence(:email){ |n| "email_#{n}@#{n}.com" }
    #password random_password
    
    factory :demo_user do
      email 'demo@example.com'
      password 'gMgUzBOlGm9f!2SJAQ'
    end
    
  end
  
end

def random_password
  ('a'..'z').to_a.shuffle.join
end