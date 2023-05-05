class ItemsController < ApplicationController
    # GET /todo_list/id/items
  def index
    @items = TodoList.find(params[:todo_list_id]).items
    
    respond_to :html
  end

  # GET 
  def new
    @todo = TodoList.find(params[:todo_list_id])
    @item = @todo.items.build
    
    respond_to :html
  end

  # CREATE 
  def create
    @item = Item.new(item_params)
    if @item.save
      #todo_lists/id/items
      redirect_to todo_list_items_path(todo_list_id: params[:todo_list_id])
    else
      redirect_to todo_lists_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to todo_list_items_path(todo_list_id: @item.todo_list_id), notice: "Item updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to todo_list_items_path(todo_list_id: @item.todo_list_id), notice: "Item deleted successfully."
  end
  
  def item_params
    params.require(:item).permit(:title, :description, :todo_list_id)
  end
end
