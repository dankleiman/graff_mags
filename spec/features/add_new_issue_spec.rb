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

    # sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit new_issue_path
    select(issue.magazine.title, :from => 'Magazine')
    fill_in 'Title', with: issue.title
    fill_in 'City', with: issue.city
    attach_file('issue[front_cover]',
      Rails.root.join('spec/fixtures/cover_test.jpg'))

    click_button 'Submit'

    expect(Issue.count).to eq(1)
    issue = Issue.last

    expect(page).to have_content 'Successfully added issue'
    expect(page).to have_image issue.front_cover.url
  end
end
