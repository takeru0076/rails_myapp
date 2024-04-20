FactoryBot.define do
  factory :daily_summary do
    date { Faker::Date.backward(days: 14) } # 過去2週間以内のランダムな日付
    todos_completed_count { Faker::Number.between(from: 0, to: 10) } # 0から10の間のランダムな数値

    association :user, factory: :user
  end
end
