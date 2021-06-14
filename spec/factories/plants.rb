FactoryBot.define do
  factory :plant do
    name { Faker::Food.vegetables }
    description { 'A very green plant' }
    days_til_harvest { rand(7..200) }
  end
end
