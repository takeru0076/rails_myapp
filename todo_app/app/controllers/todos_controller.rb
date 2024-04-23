class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todos = current_user.todos.order(created_at: :desc)
    # 直接 TodoCount モデルに対して group_by を適用
    @todo_counts = TodoCount.group(:date).sum(:todo_count)
    @todo_counts_data = @todo_counts.map { |date, count| [date.strftime('%Y-%m-%d'), count] }
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to todos_path, notice: "Todoを作成しました！"
    else
      render :new
    end
  end

  def new
    @todo = current_user.todos.build
  end

  def show
    @todo = current_user.todos.find(params[:id])
  end

  def update
    @todo = current_user.todos.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "Todoを更新しました！"
    else
      render :edit
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: "Todoを削除しました！"
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  private

  def todo_params
    params.require(:todo).permit(:content, :is_done)
  end
end
