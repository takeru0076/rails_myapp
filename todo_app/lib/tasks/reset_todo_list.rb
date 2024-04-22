require 'rake'

task :reset_todo_list do
  today = Date.today

  # 当日の日付のTodoカウントレコードを取得
  todo_count = TodoCount.find_or_create_by(user_id: current_user.id, date: today)

  # 当日のTodoカウントを0に更新
  todo_count.todo_count = 0
  todo_count.save

  # 未完了のTodoをすべて削除
  Todo.where(user_id: current_user.id, is_done: false).destroy_all
end
