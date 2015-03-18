require 'rails_helper'

feature 'User creates multiple items' do 

  before do
      @user = create(:user)
      @list = create(:list, user: @user)
  end
  
  scenario 'Successfully' do
    sign_in(@user)
    visit list_path(@list)
    fill_in 'Enter item', with: 'Buy fountain pen'
    click_button 'Create item'
    expect( page ).to have_content('Item was saved.')
    expect( page ).to have_content('Buy fountain pen')
  end
  
  scenario 'Unsuccessfully due to an undisclosed item' do
    sign_in(@user)
    visit list_path(@list)
    click_button 'Create item'
    expect ( page ).to have_content('There was an error saving the item. Please try again.')
end

end