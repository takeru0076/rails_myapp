ActiveRecord::Schema[7.1].define(version: 2024_04_19_022248) do
  create_table "daily_summaries", force: :cascade do |t|
    t.date "date"
    t.integer "todos_completed_count", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_daily_summaries_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title", null: false
    t.boolean "completed", default: false
    t.integer "daily_summary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_summary_id"], name: "index_todos_on_daily_summary_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_summaries", "users"
  add_foreign_key "todos", "daily_summaries"
end
