class TodoListsController < ApplicationController
  # GET /todolists
  def index
    @todo_lists = TodoList.all

    respond_to :html
  end

  # GET /todolists/new
  def new
    @todo_list = TodoList.new

    respond_to :html
  end

  # CREATE /todolists/create
  def create
    @todo_list = TodoList.new(todoList_params)
    if @todo_list.save
      redirect_to todo_lists_path
    else
      render :new
    end
  end

  def todoList_params
    params.require(:todo_list).permit(:name)
  end
end
