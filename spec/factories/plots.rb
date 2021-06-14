FactoryBot.define do
  factory :plot do
    size { [5, 10, 15, 20, 25].sample }
    direction { ['North', 'East', 'South', 'West'].sample }
  end
end