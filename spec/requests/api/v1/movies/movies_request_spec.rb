require 'rails_helper'

RSpec.describe 'Movies API' do
  it 'Sends a list of all movies' do
    create_list(:movie, 10)
    get(api_v1_movies_path)

    expect(response).to be_successful
    movies = JSON.parse(response.body, symbolize_names: true)
    expect(movies.count).to eq(10)
    movies.each do |movie|
      expect(movie).to have_key :imdb_id
      expect(movie[:imdb_id]).to be_a(String)

      expect(movie).to have_key :title
      expect(movie[:title]).to be_a(String)

      expect(movie).to have_key :genres
      expect(movie[:genres]).to be_a(String)

      expect(movie).to have_key :release_date
      expect(movie[:release_date]).to be_a(String)

      expect(movie).to have_key :budget
      expect(movie[:budget]).to be_an(Integer)
    end
  end
end
