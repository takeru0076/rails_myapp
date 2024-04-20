FactoryBot.define do
  factory :todo do
    title { Faker::Lorem.sentence } # ランダムなタイトル
    completed { Faker::Boolean.boolean } # ランダムな真偽値

    association :daily_summary, factory: :daily_summary
  end
end
