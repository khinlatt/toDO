class TodosController < ApplicationController
  def index
    @todos = Todo.where(done: false)
    @todone = Todo.where(done: true)
  end

  def new
    @todo = Todo.new
  end

  def todo_params
    params.require(:todo).permit(:name, :done)
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_path, :notice => "Your todo task is added!"
    else
      render "new"
    end
  end

  def edit
    @todo = Todo.find(params[:id])
    render "new"
  end

  def markasdone
    @todo = Todo.find(params[:id])
    if @todo.update_attribute(:done, true)
      redirect_to todos_path, :notice => "Your todo task is marked as done!"
    else
      redirect_to todos_path, :notice => "Your todo task is not marked as done!"
    end
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.name = params[:todo][:name]
    @todo.save
    redirect_to todos_path, :notice => "Your todo task is updated!"
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    redirect_to todos_path, :notice => "Your todo task is deleted!"
  end
end
