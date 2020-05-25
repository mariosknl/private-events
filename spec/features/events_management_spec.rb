require 'rails_helper'

RSpec.feature 'EventsManagements', type: :feature do
  before :each do
    User.create(name: 'Test User')
    User.create(name: 'Test User2')
    visit '/sessions/new'
    within('#new_user') do
      fill_in 'user_name', with: 'Test User'
    end
    click_button 'Sign In'
    click_link 'Create New Event'
    within '#new_event' do
      fill_in 'event_description', with: 'Test Event'
      fill_in 'event_date', with: '2020-10-10'
      fill_in 'event_location', with: 'Ankara'
      click_button 'Create'
    end
  end

  it 'allows user to create an event' do
    expect(Event.nil?).to be false
  end

  it 'allows users to invite users that are not been invited' do
    expect(page).to have_content('Invite')
  end

  it "allows creator to delete the event if it's upcoming" do
    expect(page).to have_content('Cancel This Event')
  end
end
