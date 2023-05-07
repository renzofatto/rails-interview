module Api
    class ItemsController < ApplicationController
      # No pedir token
      skip_before_action :verify_authenticity_token
      # Set de TodoList metodo privado
      before_action :set_todo_list
      # Set item antes de show, update y destroy metodo privado
      before_action :set_item, only: [:show, :update, :destroy]
  
      # GET /api/todolists/:todo_list_id/items
      def index
        @items = TodoList.find(params[:todo_list_id]).items
  
        render json: @items
      end
  
      # POST /api/todolists/:todo_list_id/items
      def create
        @item = @todo_list.items.new(item_params)
  
        if @item.save
          render json: @item, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/todolists/:todo_list_id/items/:id
      def update
        if @item.update(item_params)
          render json: @item
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end
  
      # DELETE /api/todolists/:todo_list_id/items/:id
      def destroy
        @item.destroy
      end
  
      # Metodos privados de la clase
      private
        def set_todo_list
          @todo_list = TodoList.find(params[:todo_list_id])
        end
  
        def set_item
          @item = @todo_list.items.find(params[:id])
        end
  
        def item_params
          params.require(:item).permit(:title, :description)
        end
    end
  end
  