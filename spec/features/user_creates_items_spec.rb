require 'rails_helper'

feature 'user creates a new item' do
  
  before do
    @user = create(:user)
    @list = create(:list)
    @list.user = @user
    @item = create(:item)
    @item.list = @list
   
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    visit new_list_path
    fill_in 'Enter list title', with: @list.title
    click_button 'Save'
    click_link 'My Lists'
    click_link @list.title
  end
  
  scenario 'successfully' do  
    fill_in 'New To-Do Item', with: @item.name
    click_button 'Add To-Do Item'
    
    expect(page).to have_content(@list.title)
    expect(page).to have_content(@item.name)
  end

  scenario 'unsuccessfully' do
    fill_in 'New To-Do Item', with: ''
    click_button 'Add To-Do Item'
    
    expect(page).to have_content('There was an error saving the item. Please try again.')
  end    
end