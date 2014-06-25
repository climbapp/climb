FactoryGirl.define do

  factory :payee do
    name { CoolFaker::Character.name }
    recurring { "yearly" }
    user
  end

end
