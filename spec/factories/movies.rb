FactoryBot.define do
  factory :movie do
    imbd_id { "MyString" }
    title { "MyString" }
    overview { "MyString" }
    production_companies { "MyString" }
    release_date { "MyString" }
    budget { 1 }
    revenue { 1 }
    runtime { 1 }
    language { "MyString" }
    genres { "MyString" }
    status { "MyString" }
  end
end
