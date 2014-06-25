require 'rails_helper'

feature 'user uploads issue', %Q(
  As user
  I want to upload a new issue
) do

  # Acceptance Criteria

  # Navigate to new upload form
  # Sees message letting them know upload was successful

  scenario 'user uploads an issue succesfully' do

    issue = FactoryGirl.create(:issue)

    visit new_issue_path
    fill_in 'Magazine', with: issue.magazine
    fill_in 'Title', with: issue.title
    fill_in 'City', with: issue.city
    fill_in 'Cover Image URL', with: issue.cover_image

    click_button 'Submit'

    save_and_open_page

    expect(page).to have_content 'Successfully added issue'
  end
end
