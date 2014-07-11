require 'rails_helper'

  feature 'admin can edit crews', %Q{
    As an admin
    I want to be able to view all crews
    So that I can edit, view, and delete them

  } do

     scenario 'admin accesses index of crews successfully' do
      user = FactoryGirl.create(:user, role: 'admin')
      crew = FactoryGirl.create(:crew)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_crews_path

      expect(page).to have_content crew.crew
    end

     scenario 'admin successfully edits crew crew' do
      user = FactoryGirl.create(:user, role: 'admin')
      crew = FactoryGirl.create(:crew)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit edit_admin_crew_path(crew)
      fill_in 'Crew', with: "Cool New Name"
      click_button 'Submit'

      crew.reload

      expect(page).to have_content crew.crew
      expect(crew.crew).to eq "Cool New Name"
    end

    scenario 'admin adds a new crew' do
      user = FactoryGirl.create(:user, role: 'admin')
      crew = FactoryGirl.build(:crew)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit new_admin_crew_path
      fill_in 'Crew', with: crew.crew
      click_button 'Submit'

      expect(page).to have_content crew.crew
    end

    scenario 'admin deletes a crew' do
      user = FactoryGirl.create(:user, role: 'admin')
      crew = FactoryGirl.create(:crew)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_crews_path
      click_on 'Delete'

      expect(page).not_to have_content crew.crew
    end
  end
