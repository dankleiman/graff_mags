require 'rails_helper'

  feature 'visitor can send a contact request', %Q{
    As a site visitor
    I want to be able to send a message
    So that I can connect with the site admin

  } do

     scenario 'user successfully contacts the site' do
      visit new_contact_form_path

      within('.contact-form') do
        fill_in 'Name', with: 'Some Graff Lover'
        fill_in 'Email', with: 'graff@example.com'
        click_button 'Send Message'
      end

      last_email = ActionMailer::Base.deliveries.last

      expect(page).to have_content('Thanks for your message!')
      expect(last_email).to have_subject('New Message on GraffMags.com')
    end
  end
