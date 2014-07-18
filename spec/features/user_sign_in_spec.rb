require 'rails_helper'

  feature 'user can sign in', %Q{
    As a user
    I want to be able to sign in
    So that I can interact with the site

  } do

    # Acceptance Criteria
    # User provides email / password
    # User sees a success message

    scenario 'user signs in successfully' do
      user = FactoryGirl.create(:user)

      sign_in_as(user)

      expect(page).to have_content 'Signed in successfully.'
    end

    scenario 'user tries to sign in without an account' do
      visit new_user_session_path
      within('#form') do
        fill_in 'Email', with: 'dog@face.com'
        fill_in 'Password', with: 'Secret12345'
        click_button 'Sign in'
      end

      expect(page).not_to have_content 'Signed in successfully.'
      expect(page).to have_content 'Invalid'
    end
  end
