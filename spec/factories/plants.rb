FactoryBot.define do
  factory :plant do
    name { Faker::Food.vegetables }
    description { 'A very green plant' }
    days_til_harvest { [14, 20, 30, 40, 55].sample }
  end
end
