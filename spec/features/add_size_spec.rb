require 'rails_helper'

  feature 'admin can edit sizes', %Q{
    As an admin
    I want to be able to view all sizes
    So that I can edit, view, and delete them

  } do

     scenario 'admin accesses index of sizes successfully' do
      user = FactoryGirl.create(:user, role: 'admin')
      size = FactoryGirl.create(:size)

      sign_in_as(user)

      visit admin_sizes_path

      expect(page).to have_content size.size
    end

     scenario 'admin successfully edits size size' do
      user = FactoryGirl.create(:user, role: 'admin')
      size = FactoryGirl.create(:size)

      sign_in_as(user)

      visit edit_admin_size_path(size)
      fill_in 'Size', with: "11x17"
      click_button 'Update'

      size.reload

      expect(page).to have_content size.size
      expect(size.size).to eq "11x17"
    end

    scenario 'admin adds a new size' do
      user = FactoryGirl.create(:user, role: 'admin')
      size = FactoryGirl.build(:size)

      sign_in_as(user)

      visit new_admin_size_path
      fill_in 'Size', with: size.size
      click_button 'Submit'

      expect(page).to have_content size.size
    end

    scenario 'admin deletes size' do
      user = FactoryGirl.create(:user, role: 'admin')
      size = FactoryGirl.create(:size)

      sign_in_as(user)

      visit admin_sizes_path
      click_link 'Delete'

      expect(page).not_to have_content size.size
    end
  end
