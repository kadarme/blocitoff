require 'rails_helper'

feature 'user sign in flow' do 
  
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
      expect(page).to have_content user.name
    end    
  end
  
  scenario 'for a registered user with an invalid email' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: 'incorrect@example.com'
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    
    within '.user-info' do
      expect(current_path).to eq user_session_path
    end    
  end
  
  scenario 'for a registered user with an invalid password' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'incorrect'
    click_button 'Sign in'
    
    within '.user-info' do
      expect(current_path).to eq user_session_path
    end    
  end
end