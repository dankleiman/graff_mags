require 'rails_helper'

  feature 'admin can edit magazines', %Q{
    As an admin
    I want to be able to view all magazines
    So that I can edit, view, and delete them

  } do

     scenario 'admin accesses index of magazines successfully' do
      user = FactoryGirl.create(:user, role: 'admin')
      magazine = FactoryGirl.create(:magazine)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_magazines_path

      expect(page).to have_content magazine.title
    end

     scenario 'admin successfully edits magazine title' do
      user = FactoryGirl.create(:user, role: 'admin')
      magazine = FactoryGirl.create(:magazine)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit edit_admin_magazine_path(magazine)
      fill_in 'Title', with: "Cool New Title"
      click_button 'Update'

      magazine.reload

      expect(page).to have_content magazine.title
      expect(magazine.title).to eq "Cool New Title"
    end

    scenario 'admin adds a new magazine' do
      user = FactoryGirl.create(:user, role: 'admin')
      magazine = FactoryGirl.build(:magazine)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit new_magazine_path(magazine)
      fill_in 'Title', with: magazine.title
      click_button 'Submit'

      expect(page).to have_content magazine.title
    end

    scenario 'admin deletes a magazine' do
      user = FactoryGirl.create(:user, role: 'admin')
      magazine = FactoryGirl.create(:magazine)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_magazines_path
      click_link 'Delete'

      expect(page).not_to have_content magazine.title
    end

  end
