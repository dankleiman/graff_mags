require 'rails_helper'

  feature 'admin can access dashboard', %Q{
    As an admin
    I want to be able to access a dashboard
    So that I can edit, view, and delete issues

  } do

    # Acceptance Criteria
    # Admin logs in
    # Admin sees dashboard

    scenario 'admin accesses dashboard in successfully' do
      user = FactoryGirl.create(:user, role: 'admin')

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      expect(page).to have_content 'Admin Dashboard'
    end

     scenario 'admin can edit an issue' do
      user = FactoryGirl.create(:user, role: 'admin')
      issue = FactoryGirl.create(:issue)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit edit_admin_issue_path(issue)

      expect(page).to have_content issue.title
    end

  end
