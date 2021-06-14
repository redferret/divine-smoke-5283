# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
2.times do |i|
    garden = FactoryBot.create(:garden, name: "Garden #{i}")
    plot_1 = FactoryBot.create(:plot, garden: garden, number: 1)
    plant_1 = FactoryBot.create(:plant, days_til_harvest: 50, name: "Squash #{i}")
    plant_2 = FactoryBot.create(:plant, days_til_harvest: 120)
    plot_1.plants << plant_1 << plant_2
    plot_2 = FactoryBot.create(:plot, garden: garden, number: 2)
    plant_3 = FactoryBot.create(:plant, days_til_harvest: 45, name: "Peppers #{i}")
    plot_2.plants << plant_2 << plant_3
end