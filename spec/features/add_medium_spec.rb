require 'rails_helper'

  feature 'admin can edit media', %Q{
    As an admin
    I want to be able to view all media
    So that I can edit, view, and delete them

  } do

     scenario 'admin accesses index of media successfully' do
      user = FactoryGirl.create(:user, role: 'admin')
      medium = FactoryGirl.create(:medium)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_media_path

      expect(page).to have_content medium.medium
    end

     scenario 'admin successfully edits medium medium' do
      user = FactoryGirl.create(:user, role: 'admin')
      medium = FactoryGirl.create(:medium)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit edit_admin_medium_path(medium)
      fill_in 'Medium', with: "B/W"
      click_button 'Update'

      medium.reload

      expect(page).to have_content medium.medium
      expect(medium.medium).to eq "B/W"
    end

    scenario 'admin adds a new medium' do
      user = FactoryGirl.create(:user, role: 'admin')
      medium = FactoryGirl.build(:medium)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit new_admin_medium_path
      fill_in 'Medium', with: medium.medium
      click_button 'Submit'

      expect(page).to have_content medium.medium
    end

    scenario 'admin deletes medium' do
      user = FactoryGirl.create(:user, role: 'admin')
      medium = FactoryGirl.create(:medium)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_media_path
      click_link 'Delete'

      expect(page).not_to have_content medium.medium
    end
  end
