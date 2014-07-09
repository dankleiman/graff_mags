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

  end
