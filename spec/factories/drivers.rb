FactoryBot.define do
  factory :driver do
    identification    { Faker::Number.number(8) }
    transit_license   { Faker::Number.number(8) }
    mail              { Faker::Internet.email }
    phone             { Faker::Number.number(12) }
    addres           { Faker::Address.street_address }
  end
end
