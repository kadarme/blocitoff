class ItemsController < ApplicationController
  respond_to :html, :js
  
  def create
    @list = List.find(params[:list_id])
    @item = Item.new(item_params)
    @item.list = @list
    
    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "There was an error saving the item. Please try again."
    end
        
    respond_with(@item) do |format|
      format.html { redirect_to list_path(@list) }
      format.js
    end   

  end
  
  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    name = @item.name
    
    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "There was an error deleting the item. Please try again."
    end
    
    respond_with(@item) do |format|
      format.html { redirect_to list_path(@list) }
      format.js
    end
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end
