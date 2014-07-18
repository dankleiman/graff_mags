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

      sign_in_as(user)

      expect(page).to have_content 'Admin Options'
    end

     scenario 'admin can edit an issue' do
      user = FactoryGirl.create(:user, role: 'admin')
      issue = FactoryGirl.create(:issue)

      sign_in_as(user)

      visit edit_admin_issue_path(issue)

      expect(page).to have_content issue.title
    end

  end
