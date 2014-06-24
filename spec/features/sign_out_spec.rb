require 'rails_helper'

feature 'user signs out', %Q(
  As a user
  I want to be able to sign out


) do

  # Acceptance Criteria

  # User sees sign-in link/button
  # Sees message letting them know they signed out

  scenario 'user signs out successfully' do
    attrs = {
      email: "dog@face.com",
      password: "Secret12345",
    }

    user = User.create!(attrs)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    click_on 'Sign out'

    expect(page).to have_content 'Signed out'
    expect(page).to have_content 'Sign in'
  end
end
