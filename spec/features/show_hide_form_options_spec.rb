require 'rails_helper'

  feature 'user can control form display', %Q{
    As a user
    I want to be able to show or hide form fields
    So that I can control how much information to enter

  } do

    # Acceptance Criteria
    # User sees options to show/hide form fields
    # User can enter less or more information about each issue
    scenario 'form fields are initially hidden' do
        user = FactoryGirl.create(:user, role: 'admin')
        issue = FactoryGirl.build(:issue)

        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign in'

        visit new_admin_issue_path

        expect(page).to have_selector(".issue-details", visible: false)
    end

    scenario 'admin successfully reveals more form fields' do
        user = FactoryGirl.create(:user, role: 'admin')
        issue = FactoryGirl.build(:issue)

        visit new_user_session_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Sign in'

        visit new_admin_issue_path
        click_link 'Add More Details'

        expect(page).to have_content 'Year of Publication'
    end
  end
