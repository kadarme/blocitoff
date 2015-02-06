class ListsController < ApplicationController
  before_action :authenticate_user!
  # users must be signed in before any lists_controller method 
  before_action :get_list, only: [:edit, :update, :destroy]
  
  def get_list
    @list = List.find(params[:id])
  end
  
  def index
  end

  def show
    @list = current_user.list
    @items = @list.items
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
  end
  
  private
  
  def list_params
    params.require(:list).permit(:title)
  end
end
