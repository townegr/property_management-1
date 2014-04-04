require 'spec_helper'

feature 'add a building owner', %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  #Acceptance Criteria
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'all valid attributes are supplied' do
    prev_count = Owner.count
    owner = FactoryGirl.build(:owner)
    visit new_owner_path
    fill_in 'First name', with: owner.first_name
    fill_in 'Last name', with: owner.last_name
    fill_in 'Email', with: owner.email
    fill_in 'Company name', with: owner.company_name
    click_on 'Create Owner'

    expect(Owner.count).to eq(prev_count + 1)
    expect(page).to have_content('Owner is successfully saved')
  end

  scenario 'receives error when not all valid attributes are supplied'
end
