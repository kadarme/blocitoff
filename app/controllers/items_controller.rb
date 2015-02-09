class ItemsController < ApplicationController
  respond_to :html, :js
  
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build( item_params )

    
    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash[:error] = "There was an error saving the item. Please try again."
      render :new
    end
        
    respond_with do |format|
      format.html { redirect_to @list}
    end   

  end
  
  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Item was removed."
    else
      flash[:error] = "Item couldn't be deleted. Please try again."
    end
    
    respond_with(@item) do |format|
      format.html { redirect_to [@list]}
    end
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end
