require 'rails_helper'

feature 'user sign out flow' do 
  
  scenario 'for a registered user' do
    user = create(:user)
    visit root_path
    within '.user-info' do
      click_link 'Sign In'
    end
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    within 'form' do
      click_button 'Sign in'
    end  
    within '.user-info' do
      click_link 'Sign out'
    end
    
    within '.user-info' do
      expect(page).to have_content 'Sign In or Sign Up'
    end
  end
  
  
end