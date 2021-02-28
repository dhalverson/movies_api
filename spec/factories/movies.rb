FactoryBot.define do
  factory :movie do
    imbd_id { "MyString" }
    title { Faker::Movie.title }
    overview { Faker::Lorem.sentence }
    production_companies { [{"name": "Disney Pictures", "id": 2303}] }
    release_date { "MyString" }
    budget { 1 }
    revenue { 1 }
    runtime { 1 }
    language { "English" }
    genres { [{"id": 18, "name": "Drama"}, {"id": 80, "name": "Crime"}] }
    status { "Released" }
  end
end
