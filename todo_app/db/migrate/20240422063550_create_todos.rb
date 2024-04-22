class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.text :content
      t.boolean :is_done

      t.timestamps
    end
  end
end
