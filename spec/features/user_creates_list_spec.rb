require 'rails_helper'

feature 'user creates a new list' do
  
  before do
    @user = create(:user)
    @list = create(:list)
    @list.user = @user
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
  end
  
  scenario 'successfully' do
    visit new_list_path
    fill_in 'Enter list title', with: @list.title
    click_button 'Save'
    
    expect(page).to have_content(@list.title)
  end
  
  scenario 'unsuccessfully saved due to no title' do
    visit new_list_path
    click_button 'Save'
    
    expect(page).to have_content('There was an error saving the list. Please try again.')
  end
  
  scenario 'then updates the list successfully' do
    visit new_list_path
    fill_in 'Enter list title', with: @list.title
    click_button 'Save'
    click_link 'My Lists'
    click_link @list.title
    click_link 'Edit List'
    fill_in 'Enter list title' , with: 'New List Title'
    click_button 'Save'
    
    expect(page).to have_content('List was updated.')
  end
   
  scenario 'then updates the list unsuccessfully' do
    visit new_list_path
    fill_in 'Enter list title', with: @list.title
    click_button 'Save'
    click_link 'My Lists'
    click_link @list.title
    click_link 'Edit List'
    fill_in 'Enter list title' , with: ''
    click_button 'Save'
    
    expect(page).to have_content('There was an error updating the list. Please try again.')
  end
end

  