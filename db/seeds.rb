# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do
    garden = FactoryBot.create(:garden, name: Faker::Name.name)
    5.times do |i|
      plot = FactoryBot.create(:plot, garden: garden, number: i)
      10.times do
        plant = FactoryBot.create(:plant)
        plot.plants << plant
      end
    end
end