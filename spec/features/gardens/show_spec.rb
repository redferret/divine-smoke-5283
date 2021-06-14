require 'rails_helper'

RSpec.describe 'The show page for a garden,' do
  before :each do
    @garden = FactoryBot.create(:garden, name: 'My Garden')

    @plot_1 = FactoryBot.create(:plot, garden: @garden, number: 1)
    @plant_1 = FactoryBot.create(:plant, days_til_harvest: 50, name: 'Squash')
    @plant_2 = FactoryBot.create(:plant, days_til_harvest: 120)
    @plot_1.plants << @plant_1 << @plant_2

    @plot_2 = FactoryBot.create(:plot, garden: @garden, number: 2)
    @plant_3 = FactoryBot.create(:plant, days_til_harvest: 45, name: 'Peppers')
    @plot_2.plants << @plant_2 << @plant_3

    visit garden_path(@garden)
  end

  describe 'plants list,' do
    it 'only shows distinct plant names' do
      within '#plants-list' do
        expect(page).to have_content('Squash', count: 1)
        expect(page).to have_content('Peppers')
      end
    end

    it 'only shows plants that are ready to harvest in less than 100 days' do
      within '#plants-list' do
        expect(page).to have_content('50')
        expect(page).to have_content('45')
      end
    end
  end
end