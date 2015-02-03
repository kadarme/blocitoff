class ListsController < ApplicationController
  before_action :authenticate_user! # users must be signed in before any lists_controller method 
  
  def index
  end

  def show
    @list = List.find(params[:id])
    @items = @list.items
    @item = @list.items.build
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :new
    end
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error updating the list. Please try again."
      render :edit
    end
  end
  
  def destroy
    @list = List.find(params[:id])
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title)
  end
end
