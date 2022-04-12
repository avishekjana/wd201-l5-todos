class TodosController < ApplicationController

  def index
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = current_user.todos.find(id)
    render plain: todo.to_displayable_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date]) if params[:due_date].present?
    new_todo = Todo.new(todo_text: todo_text, due_date: due_date, completed: false, user_id: @current_user.id)
    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def update
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.completed = params[:completed]
    todo.save!
    redirect_to todos_path
    # render plain: "Updated todo completed status to #{params[:completed]}"
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
