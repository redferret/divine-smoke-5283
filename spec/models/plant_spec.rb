require 'rails_helper'

RSpec.describe Plant, type: :model do
  before :each do
    @garden = FactoryBot.create(:garden, name: 'My Garden')

    @plot_1 = FactoryBot.create(:plot, garden: @garden, number: 1)
    @plant_1 = FactoryBot.create(:plant, days_til_harvest: 50, name: 'Squash')
    @plant_2 = FactoryBot.create(:plant, days_til_harvest: 120)
    @plot_1.plants << @plant_1 << @plant_2

    @plot_2 = FactoryBot.create(:plot, garden: @garden, number: 2)
    @plant_3 = FactoryBot.create(:plant, days_til_harvest: 45, name: 'Peppers')
    @plot_2.plants << @plant_2 << @plant_3
  end

  describe 'class method,' do
    describe '::plants_for_garden' do
      it 'only shows distinct plant names and plants harvest days less than 100' do
        expected_result = [@plant_1, @plant_3]
        expect(Plant.plants_for_garden(@garden.id)).to eq expected_result
      end
    end
  end
end
