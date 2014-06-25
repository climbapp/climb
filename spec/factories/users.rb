# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest 'password'
  end

  factory :user_phone, class: User do
    email { Faker::Internet.email }
    password_digest 'password'
    sms_remind? { true }
    phone { Faker::PhoneNumber.cell_phone}
  end

end
