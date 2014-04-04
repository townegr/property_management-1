require 'spec_helper'

feature 'record a building', %{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  #Acceptance criteria
  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'all valid attributes are supplied' do
    prev_count = Building.count
    building = FactoryGirl.build(:building)
    #'buildings/new'
    visit new_building_path
    fill_in 'Street address', with: building.street_address
    fill_in 'City', with: building.city
    select building.state, from: 'State'
    fill_in 'Postal code', with: building.postal_code
    click_on 'Create Building'

    expect(Building.count).to eq(prev_count + 1)
    expect(page).to have_content('Building is successfully saved')
  end

  scenario 'not all valid attributes are supplied'

  scenario 'Only US states are accepted'

end
