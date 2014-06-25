FactoryGirl.define do

  factory :user do
    username { CoolFaker::Character.name }
    password_digest 'password'
  end

  factory :user_phone, class: User do
    username { CoolFaker::Character.name }
    email { Faker::Internet.email }
    password_digest 'password'
    sms_remind? { true }
    phone { Faker::PhoneNumber.cell_phone}
  end

  factory :payee do
    name { CoolFaker::Character.name }
    recurring { "yearly" }
    user
  end

  factory :bill do
    name { CoolFaker::Character.name }
    paid? { false }
    amount_due { rand }
    due_date { Time.now }
    late_fee { rand }
    interest { rand }
    min_due { rand }
    payee
  end

end
