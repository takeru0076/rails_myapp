class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.boolean :completed, default: false
      t.references :daily_summary, foreign_key: true

      t.timestamps
    end
  end
end
