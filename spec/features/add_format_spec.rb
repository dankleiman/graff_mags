require 'rails_helper'

  feature 'admin can edit formats', %Q{
    As an admin
    I want to be able to view all formats
    So that I can edit, view, and delete them

  } do

     scenario 'admin accesses index of formats successfully' do
      user = FactoryGirl.create(:user, role: 'admin')
      format = FactoryGirl.create(:format)

      sign_in_as(user)

      visit admin_formats_path

      expect(page).to have_content format.format
    end

     scenario 'admin successfully edits format format' do
      user = FactoryGirl.create(:user, role: 'admin')
      format = FactoryGirl.create(:format)

      sign_in_as(user)

      visit edit_admin_format_path(format)
      fill_in 'Format', with: "Poster"
      click_button 'Update'

      format.reload

      expect(page).to have_content format.format
      expect(format.format).to eq "Poster"
    end

    scenario 'admin adds a new format' do
      user = FactoryGirl.create(:user, role: 'admin')
      format = FactoryGirl.build(:format)

      sign_in_as(user)

      visit new_admin_format_path
      fill_in 'Format', with: format.format
      click_button 'Submit'

      expect(page).to have_content format.format
    end
    scenario 'admin deletes a format' do
      user = FactoryGirl.create(:user, role: 'admin')
      format = FactoryGirl.create(:format, format: 'Postcard')

      sign_in_as(user)

      visit admin_formats_path
      click_link 'Delete'

      expect(page).not_to have_content format.format
    end


  end
