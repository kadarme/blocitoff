require 'rails_helper'

feature 'user deletes a new list' do
  
  before do
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
  end
  
  scenario 'successfully' do  
    visit new_list_path
    fill_in 'Enter list title', with: 'Items to buy'
    click_button 'Save'
    click_link 'Delete List' 
    
    expect(page).to have_content('List was deleted.')
  end
  
end
