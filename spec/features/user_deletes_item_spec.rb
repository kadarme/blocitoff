require 'rails_helper'

feature 'user deletes a new item' do
  
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
    fill_in 'New To-Do Item', with: @item.name
    click_button 'Add To-Do Item'
  end
  
  scenario 'successfully' do  
    click_link ''
    
    expect(page).to have_content('Item was removed.')
  end

end