require 'rails_helper'

RSpec.feature 'Authentications', type: :feature do
  before :each do
    User.create(name: 'Test User')
    visit '/sessions/new'
  end

  it 'redirects to root after log in' do
    fill_in 'user_name', with: 'Test User'
    click_button 'Sign In'
    expect(page).to have_current_path(root_path)
  end

  it 'redirects to Sign In page when user name not exists' do
    within('#new_user') do
      fill_in 'user_name', with: 'Wrong User Name'
    end
    click_button 'Sign In'
    expect(page).to have_current_path(sessions_path)
  end

  it 'promts user name after sign in' do
    within('#new_user') do
      fill_in 'user_name', with: 'Test User'
    end
    click_button 'Sign In'
    expect(page).to have_content 'Test User'
  end

  it 'promts user name after sign in' do
    within('#new_user') do
      fill_in 'user_name', with: 'Wrong User Name'
    end
    click_button 'Sign In'
    expect(page).not_to have_content 'Test User'
  end
end
