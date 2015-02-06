require 'rails_helper'

feature 'User creates todo' do
  scenario 'Successfully' do
    visit new_list_path
    fill_in 'Enter list title', with: 'Need to do'
    save_and_open_page
    click_button 'Save'
    expect( page ).to have_content('List was saved.')
    expect( page ).to have_content('Need to do')
  end
end
