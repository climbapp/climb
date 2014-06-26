require 'rails_helper'

feature 'Index page' do
  scenario 'user sees sign in information on index page' do
    visit root_path
    expect(page).to have_content('Welcome to Climb')
    expect(page).to have_link('Log In', :href => new_session_path)
  end
end
