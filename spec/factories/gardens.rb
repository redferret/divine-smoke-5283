FactoryBot.define do
  factory :garden do
    organic { Faker::Boolean.boolean }
  end
end