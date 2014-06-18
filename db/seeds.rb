def getNum
  ((10000.0 - 200.0) * rand() + 200).round(2)
end

def getCategory
  categories = ["Savings", "Credit", "Debt", "Income"]
  categories.sample
end

def getDate
  Date.today+(10000*rand())
end

User.destroy_all
Payee.destroy_all
Bill.destroy_all

joe = User.create({ name: "Joe Blow", email: "joe@charity.org", password: "123", sms_remind?: true, email_remind?: false })

users = [joe]
10.times do
  users << User.create({name: CoolFaker::Character.name, email: Faker::Internet.email, password: 'helloworld', sms_remind?: [true, false].sample, email_remind?: [true, false].sample ,phone: Faker::Number.number(10)})
end

payees = []
users.each do |user|
  6.times do
    payees << Payee.create({name: CoolFaker::Character.name, recurring: ["Annually", "Monthly", "Weekly"].sample, user: user})
  end
end

comcast = Payee.create({ name: "Comcast", recurring: "Monthly", user: joe })
payees << comcast

bills = []
payees.each do |payee|
  3.times do
    bills << Bill.create({ name: CoolFaker::Character.name, paid?: false, amount_due: getNum, due_date: getDate, late_fee: getNum, interest: getNum, min_due: getNum, payee: payee })
  end
end
