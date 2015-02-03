class ItemsController < ApplicationController
  respond_to :html, :js
  
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build( item_params )
   
    
    if @item.save
      flash[:notice] = "Comment was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render :new
    end
  end
  
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end
