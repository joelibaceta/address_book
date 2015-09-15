FactoryGirl.define do
  factory :contact do |f| 
    sequence(:first_name){ |n| "user_name_#{n}" }
    sequence(:last_name){ |n| "last_name_#{n}" }
    sequence(:email){ |n| "email_#{n}@#{n}.com" }
    sequence(:address){ |n| "Lima Av. #{n} Peru" }
    
    factory :example_contact do
      first_name 'Juan'
      last_name 'Aliaga'
      email 'juan@aliaga.com'
      phone '(34) 9345 3495'
      address '8101 Catherine Street Irmo, SC 29063'
      user_id '1'
    end
    
    factory :duplicate_contact do
      first_name 'Juana'
      last_name 'Aliaga'
      email 'juan@aliaga.com'
      phone '(34) 2394 2394'
      address '2180 Wall Street Dubuque, IA 52001'
      user_id '1'
    end
  end
  
  
end