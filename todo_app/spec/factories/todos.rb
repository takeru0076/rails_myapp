FactoryBot.define do
  factory :todo do
    user_id { 1 }
    content { "MyText" }
    is_done { false }
  end
end
