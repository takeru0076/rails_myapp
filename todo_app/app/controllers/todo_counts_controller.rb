class TodoCountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @today = Date.today
    @todo_counts = current_user.todo_counts.order(date: :desc)
  end
end
