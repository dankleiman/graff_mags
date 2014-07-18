require 'rails_helper'

feature 'user signs out', %Q(
  As a user
  I want to be able to sign out


) do

  # Acceptance Criteria

  # User sees sign-in link/button
  # Sees message letting them know they signed out

  scenario 'user signs out successfully' do
    user = FactoryGirl.create(:user)

    sign_in_as(user)

    click_on 'Sign out'

    expect(page).to have_content 'Signed out'
    expect(page).to have_content 'Sign in'
  end
end
