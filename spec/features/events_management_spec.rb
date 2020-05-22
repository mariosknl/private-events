require 'rails_helper'

RSpec.feature 'EventsManagements', type: :feature do
  before :each do
    User.create(name: 'Test User')
    visit '/sessions/new'
    within('#new_user') do
      fill_in 'user_name', with: 'Test User'
    end
    click_button 'Sign In'
    visit ''
    # Event.create(description: '')
  end

  it 'allows user to create an event' do
    expect(page).to have_current_path(root_path)
  end
end
