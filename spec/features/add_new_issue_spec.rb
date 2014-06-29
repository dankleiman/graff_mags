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
    attach_file('issue[cover]', 'spec/fixtures/cover_test.jpg')

    click_button 'Submit'

    issue.reload

    # binding.pry
    save_and_open_page

    expect(page).to have_content 'Successfully added issue'
    expect(page).to have_image issue.cover.url
  end
end
