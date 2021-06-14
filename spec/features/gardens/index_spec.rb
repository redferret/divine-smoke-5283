require 'rails_helper'

RSpec.describe 'The index page for gardens,' do
  before :each do
    @garden_1 = FactoryBot.create(:garden, name: 'Community Garden 1')
    @garden_2 = FactoryBot.create(:garden, name: 'Community Garden 2')

    visit gardens_path
  end

  it 'shows the list of gardens' do
    expect(page).to have_content(@garden_1.name)
    expect(page).to have_content(@garden_2.name)
  end
end