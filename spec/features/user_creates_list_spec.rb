require 'rails_helper'

feature 'User creates a new list' do
  before do
    @user = create(:user)
  end
  
  scenario 'Successfully' do
    sign_in(@user)
    visit new_list_path
    fill_in 'Enter list title', with: 'Items to buy'
    click_button 'Save'
    expect(page).to have_content('List was saved.')
    expect(page).to have_content('Items to buy')
  end
  
  scenario 'Unsuccessfully saved due to no title' do
    sign_in(@user)
    visit new_list_path
    click_button 'Save'
    expect(page).to have_content('There was an error saving the list. Please try again.')
  end
end

  