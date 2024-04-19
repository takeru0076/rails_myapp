class CreateDailySummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_summaries do |t|
      t.date :date
      t.integer :todos_completed_count, default: 0
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
