FactoryGirl.define do

  factory :user do
    name { CoolFaker::Character.name }
    email { Faker::Internet.email }
    password { CoolFaker::Character.name }
  end

  factory :user_phone, class: User do
    name { CoolFaker::Character.name }
    email { Faker::Internet.email }
    password { CoolFaker::Character.name }
    sms_remind? { true }
    phone { Faker::PhoneNumber.cell_phone}
  end


end