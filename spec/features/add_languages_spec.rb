require 'rails_helper'

  feature 'admin can edit languages', %Q{
    As an admin
    I want to be able to view all languages
    So that I can edit, view, and delete them

  } do

     scenario 'admin accesses index of languages successfully' do
      user = FactoryGirl.create(:user, role: 'admin')
      language = FactoryGirl.create(:language)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_languages_path

      expect(page).to have_content language.language
    end

     scenario 'admin successfully edits language language' do
      user = FactoryGirl.create(:user, role: 'admin')
      language = FactoryGirl.create(:language)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit edit_admin_language_path(language)
      fill_in 'Language', with: "Poster"
      click_button 'Submit'

      language.reload

      expect(page).to have_content language.language
      expect(language.language).to eq "Poster"
    end

    scenario 'admin adds a new language' do
      user = FactoryGirl.create(:user, role: 'admin')
      language = FactoryGirl.build(:language)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit new_admin_language_path
      fill_in 'Language', with: language.language
      click_button 'Submit'

      expect(page).to have_content language.language
    end

    scenario 'admin deletes a language' do
      user = FactoryGirl.create(:user, role: 'admin')
      language = FactoryGirl.create(:language)

      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      visit admin_languages_path
      click_link 'Delete'

      expect(page).not_to have_content language.language
    end
  end
