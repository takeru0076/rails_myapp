class CreateTodoCounts < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_counts do |t|
      t.integer :user_id
      t.date :date
      t.integer :todo_count

      t.timestamps
    end
  end
end
