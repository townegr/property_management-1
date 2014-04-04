require 'spec_helper'

feature 'build and owner relationship', %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  #Acceptance Criteria
  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'Owner can be selected for a building' do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.build(:building)
    visit new_building_path
    fill_in 'Street address', with: building.street_address
    fill_in 'City', with: building.city
    select building.state, from: 'State'
    fill_in 'Postal code', with: building.postal_code
    select owner.last_name, from: 'Owner'
    click_on 'Create Building'

    expect(page).to have_content('Building is successfully saved')
    expect(building.owner.first_name).to eq("John")
  end

  scenario "Building no longer associates with any owner when owner is deleted" do
    owner = FactoryGirl.create(:owner)
    building_one = FactoryGirl.create(:building, owner_id: owner.id)
    building_two = FactoryGirl.create(:building, owner_id: owner.id)

    visit owners_path
    building_count = owner.buildings.count
    click_on "Delete"
    expect(building_one.owner).to eql(nil)
    expect(building_two.owner).to eql(nil)
  end

end
