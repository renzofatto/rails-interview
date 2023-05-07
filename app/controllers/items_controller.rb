class ItemsController < ApplicationController
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
      redirect_to todo_list_items_path(todo_list_id: params[:todo_list_id])
    else
      redirect_to todo_lists_path
    end
  end

  #DELETE
  def destroy
    @item = Item.find(params[:id])
    @todo_list = @item.todo_list
    @item.destroy
    redirect_to todo_list_items_path(todo_list_id: @todo_list.id), notice: "Item deleted successfully."
  end

  # UPDATE
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to todo_list_items_path(todo_list_id: @item.todo_list_id), notice: "Item updated successfully."
    else
      render :edit
    end
  end
  
  def edit
    @todo_list = TodoList.find(params[:todo_list_id])
    @item = @todo_list.items.find(params[:id])
  end
  
  
  def item_params
    params.require(:item).permit(:title, :description, :todo_list_id)
  end
end
