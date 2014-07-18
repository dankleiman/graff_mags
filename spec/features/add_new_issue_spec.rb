require 'rails_helper'

feature 'user uploads issue', %Q(
  As user
  I want to upload a new issue
) do

  # Acceptance Criteria

  # Navigate to new upload form
  # Sees message letting them know upload was successful

  scenario 'user uploads an issue succesfully' do

    issue = FactoryGirl.build(:issue)
    user = FactoryGirl.create(:user, role: 'admin')

    sign_in_as(user)

    visit new_admin_issue_path

    fill_in 'Magazine Title', with: issue.magazine_title
    fill_in 'Issue Title', with: issue.title
    attach_file('issue[front_cover]',
      Rails.root.join('spec/fixtures/cover_test.jpg'))

    click_button 'Submit'

    expect(Issue.count).to eq(1)
    issue = Issue.last

    expect(page).to have_content 'Successfully added issue'
    expect(page).to have_image issue.front_cover.url(:medium)
  end

    scenario 'admin deletes a issue' do
      user = FactoryGirl.create(:user, role: 'admin')
      issue = FactoryGirl.create(:issue)

      sign_in_as(user)

      visit admin_issues_path
      click_link 'Delete'

      expect(page).not_to have_content issue.title
    end
end
