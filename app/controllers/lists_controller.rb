class ListsController < ApplicationController
  before_action :authenticate_user!
  # users must be signed in before any lists_controller method 
  before_action :get_list, only: [:show, :edit, :update, :destroy]
  
  def get_list
    @list = current_user.lists.find(params[:id])
  end
  
  def index
    @lists = current_user.lists
  end

  def show
    @items = @list.items
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)
    
    if @list.save
      flash[:notice] = "List was saved."
      redirect_to @list
    else
      flash[:error] = "There was an error saving the list. Please try again."
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      redirect_to @list
    else
      flash[:error] = "There was an error updating the list. Please try again."
      render :edit
    end
  end
  
  def destroy
    if @list.destroy
      flash[:notice] = "List was deleted."
      redirect_to lists_path
    else
      flash[:error] = "There was an error deleting the list. Please try again."
      render :show
    end
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title)
  end
  
end
