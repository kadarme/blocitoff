require 'rails_helper'

describe ItemsController, :type => :controller do
include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
    @list = create(:list)
    @list.user = @user
  end
    
  describe '#destroy' do 
    it "deletes an item" do 
      @item = create(:item)
      @item.list = @list
      @item.save
      
      
      expect { delete :destroy, { list_id: @list, id: @item } }.to change(Item, :count).by(-1)
    end
  end
end
