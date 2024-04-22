# todo.rb

class Todo < ApplicationRecord
  validates :title, presence: true

  belongs_to :daily_summary, optional: true # daily_summary_id が空でも良いようにオプションを追加

  before_validation :create_daily_summary, on: :create

  belongs_to :user

  private

  def create_daily_summary
    # Todo が関連付けられる日付を取得
    todo_date = created_at.to_d # もしくは任意の日付を設定する方法に変更

    user_id = user_id || user.id

    self.daily_summary = DailySummary.find_or_create_by(date: todo_date, user_id: user_id)
  end
end
