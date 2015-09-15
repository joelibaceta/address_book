Factory.define :contact do |f| 
  f.sequence(:first_name){ |n| "user_name_#{n}" }
  f.sequence(:last_name){ |n| "last_name_#{n}" }
  f.sequence(:email){ |n| "email_#{n}@#{n}.com" }
  f.sequence(:address){ |n| "Lima Av. #{n} Peru" }
end