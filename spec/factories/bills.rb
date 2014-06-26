FactoryGirl.define do

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
