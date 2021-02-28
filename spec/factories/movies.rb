FactoryBot.define do
  factory :movie do
    imdb_id { "tt100" }
    title { Faker::Movie.title }
    overview { Faker::Lorem.sentence }
    production_companies { [{"name": "Disney Pictures", "id": 2303}] }
    release_date { Faker::Date.between(from: '2010-01-01', to: '2020-01-01') }
    budget { Faker::Number.between(from: 1, to: 1_000_000) }
    revenue { Faker::Number.between(from: 1, to: 3_000_000) }
    runtime { Faker::Number.between(from: 30, to: 210) }
    language { "English" }
    genres { [{"id": 18, "name": "Drama"}, {"id": 80, "name": "Crime"}] }
    status { "Released" }
  end
end

