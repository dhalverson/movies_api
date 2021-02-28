require 'rails_helper'

RSpec.describe 'Movies API' do
  it 'Sends a list of all movies' do
    create_list(:movie, 15)
    get(api_v1_movies_path)

    expect(response).to be_successful
    movies = JSON.parse(response.body, symbolize_names: true)

    movies[:data].each do |movie|
      expect(movie[:attributes]).to have_key :imdb_id
      expect(movie[:attributes][:imdb_id]).to be_a(String)

      expect(movie[:attributes]).to have_key :title
      expect(movie[:attributes][:title]).to be_a(String)

      expect(movie[:attributes]).to have_key :genres
      expect(movie[:attributes][:genres]).to be_an(Array)

      expect(movie[:attributes]).to have_key :release_date
      expect(movie[:attributes][:release_date]).to be_a(String)

      expect(movie[:attributes]).to have_key :budget
      expect(movie[:attributes][:budget]).to be_a(String)
    end
  end

  # Need to determine a way to test the page query params work correctly, and navigate to the page specified
  xit 'Sends a list of all movies with a page query' do
    create_list(:movie, 15)
    get(api_v1_movies_path, :params => {:page => 2})

    expect(response).to be_successful
    movies = JSON.parse(response.body, symbolize_names: true)

    movies[:data].each do |movie|
      expect(movie[:attributes]).to have_key :imdb_id
      expect(movie[:attributes][:imdb_id]).to be_a(String)

      expect(movie[:attributes]).to have_key :title
      expect(movie[:attributes][:title]).to be_a(String)

      expect(movie[:attributes]).to have_key :genres
      expect(movie[:attributes][:genres]).to be_an(Array)

      expect(movie[:attributes]).to have_key :release_date
      expect(movie[:attributes][:release_date]).to be_a(String)

      expect(movie[:attributes]).to have_key :budget
      expect(movie[:attributes][:budget]).to be_a(String)
    end
  end  
end
