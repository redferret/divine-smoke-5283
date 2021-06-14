require 'rails_helper'

RSpec.describe 'The index page for plots,' do
  before :each do
    @garden = FactoryBot.create(:garden, name: 'My Garden')

    @plot_1 = FactoryBot.create(:plot, garden: @garden, number: 1)
    @plant_1 = FactoryBot.create(:plant)
    @plant_2 = FactoryBot.create(:plant)
    @plot_1.plants << @plant_1 << @plant_2

    @plot_2 = FactoryBot.create(:plot, garden: @garden, number: 2)
    @plant_3 = FactoryBot.create(:plant)
    @plant_4 = FactoryBot.create(:plant)
    @plot_2.plants << @plant_3 << @plant_4

    visit garden_plots_path(@garden)
  end

  describe 'page,' do
    it 'has a title with the garden name' do
      expect(page).to have_content(@garden.name)
    end
  end

  describe 'main list,' do
    describe 'each plot,' do
      it 'has a number for that plot' do
        within '#plots-list' do
          within "#plot-#{@plot_1.id}" do
            expect(page).to have_content("Plot ##{@plot_1.number}")
          end
          within "#plot-#{@plot_2.id}" do
            expect(page).to have_content("Plot ##{@plot_2.number}")
          end
        end
      end

      describe 'remove plant link,' do
        it 'shows a button to remove the plant from the plot' do
          within "#plant-#{@plant_1}" do
            expect(page).to have_link('Remove Plant')
            click_link 'Remove Plant'
          end
        end
        
        it 'navigates back to the index page without the plant shown' do
          expect(current_path).to eq garden_plots_path(@garden)
          
          within "#plots-#{@plot_1}-plants-list" do
            expect(page).to_not have_content(@plant_1.name)
          end
        end
      end

      it 'under the plot number is the list of plants and their names' do
        within "#plots-#{@plot_1.id}-plants-list" do
          expect(page).to have_content(@plant_1.name)
          expect(page).to have_content(@plant_2.name)
        end
      end
    end
  end
end