require 'rails_helper'

  feature 'admin can edit stitchings', %Q{
    As an admin
    I want to be able to view all stitchings
    So that I can edit, view, and delete them

  } do

     scenario 'admin accesses index of stitchings successfully' do
      user = FactoryGirl.create(:user, role: 'admin')
      stitching = FactoryGirl.create(:stitching)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_stitchings_path

      expect(page).to have_content stitching.binding
    end

     scenario 'admin successfully edits stitching stitching' do
      user = FactoryGirl.create(:user, role: 'admin')
      stitching = FactoryGirl.create(:stitching)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit edit_admin_stitching_path(stitching)
      fill_in 'Binding', with: "3 side staples"
      click_button 'Submit'

      stitching.reload

      expect(page).to have_content stitching.binding
      expect(stitching.binding).to eq "3 side staples"
    end

    scenario 'admin adds a new stitching' do
      user = FactoryGirl.create(:user, role: 'admin')
      stitching = FactoryGirl.build(:stitching)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit new_admin_stitching_path
      fill_in 'Binding', with: stitching.binding
      click_button 'Submit'

      expect(page).to have_content stitching.binding
    end
    scenario 'admin deletes a stitching' do
      user = FactoryGirl.create(:user, role: 'admin')
      stitching = FactoryGirl.create(:stitching)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_stitchings_path
      click_link 'Delete'

      expect(page).not_to have_content stitching.binding
    end
  end
