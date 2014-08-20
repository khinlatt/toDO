class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo = Todo.find(params[:todo_id])
    @doitems = @todo.items.where(done: false)
    @doneitems = @todo.items.where(done: true)
  end

  def item_params
    params.require(:item).permit(:description, :todo_id, :done)
  end

  def new
    @todo = Todo.find(params[:todo_id])
    @item = @todo.items.new
    # @item = @todo.items.find(params[:todo_id])
    # id = params[:todo_id]
    # @item = Item.new
    # @item.todo_id = id
    # binding.pry
  end

  def create
    @todo = Todo.find(params[:todo_id])
    @item = @todo.items.new(item_params)
    # @item.description = params[:item][:description]

    if @item.save
      redirect_to todo_items_path, :notice => "Task is successfully added!"
    else
      render "new"
    end
  end

  def edit
    @todo = Todo.find(params[:todo_id])
    @item = @todo.items.find(params[:id])
    render "new"
  end

  def markasdone
    @todo = Todo.find(params[:todo_id])
    @item = @todo.items.find(params[:id])
    if @item.update_attribute(:done, true)
      redirect_to todo_items_path, :notice => "Your item is marked as done!"
    else
      redirect_to todo_items_path, :notice => "Your item is not marked as done!"
    end
  end

  def update
    @todo = Todo.find(params[:todo_id])
    @item = @todo.items.find(params[:id])
    @item.description = params[:item][:description]
    @item.save
    redirect_to todo_items_path, :notice => "Task is successfully updated!"
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to todo_items_path, :notice => "Task is deleted!"
  end
end
