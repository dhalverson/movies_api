FactoryBot.define do
  factory :rating do
    user_id { "MyString" }
    rating { 1.5 }
    timestamp { "2021-02-27 16:18:55" }
    movie { nil }
  end
end
