FactoryBot.define do
  factory :passenger do
    identification    { Faker::Number.number(8) }
    mail              { Faker::Internet.email }
    phone             { Faker::Number.number(12) }
  end
end
