class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    #@todo = Todo.create(todo_params)
    #@todo.save
    #redirect_to root_path #todosに変更

    @todo = current_user.todos.build(todo_params)

    if @todo.save
      flash[:notice] = '投稿しました'
      redirect_to root_path # 一時的にトップページへリダイレクト(要修正)
    else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end

    create_daily_summary(current_user)
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  private
    def todo_params
      params.require(:todo).permit(:title, :daily_summary_id)
    end

end

