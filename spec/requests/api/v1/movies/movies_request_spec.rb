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
  it 'Sends a list of all movies with a page query' do
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
  
  it 'Can return a single movie by ID' do
    movie = create(:movie)
    get(api_v1_movie_path(movie))

    expect(response).to be_successful
    movie = JSON.parse(response.body, symbolize_names: true)

    expect(movie[:data][:attributes]).to have_key :imdb_id
    expect(movie[:data][:attributes][:imdb_id]).to be_a(String)

    expect(movie[:data][:attributes]).to have_key :title
    expect(movie[:data][:attributes][:title]).to be_a(String)

    expect(movie[:data][:attributes]).to have_key :genres
    expect(movie[:data][:attributes][:genres]).to be_an(Array)

    expect(movie[:data][:attributes]).to have_key :release_date
    expect(movie[:data][:attributes][:release_date]).to be_a(String)

    expect(movie[:data][:attributes]).to have_key :budget
    expect(movie[:data][:attributes][:budget]).to be_a(String)
  end

  it 'Can return movies by release year' do
    movie1 = create(:movie, release_date: '2020-01-01')
    movie2 = create(:movie, release_date: '2010-01-01')
    movie3 = create(:movie, release_date: '2010-01-01')

    get(api_v1_movies_path, :params => {:year => 2010})

    expect(response).to be_successful
    movie = JSON.parse(response.body, symbolize_names: true)

    expect(movie[:data].count).to eq(2)
    expect(movie[:data].first[:attributes][:release_date]).to eq('2010-01-01')
  end  

  it 'Can return movies by genre keyword' do
    movie1 = create(:movie, genres: "[{\"id\": 18, \"name\": \"Comedy\"}, {\"id\": 80, \"name\": \"Romance\"}]")
    movie2 = create(:movie, genres: "[{\"id\": 19, \"name\": \"Drama\"}, {\"id\": 81, \"name\": \"Comedy\"}]")
    movie3 = create(:movie, genres: "[{\"id\": 20, \"name\": \"Drama\"}, {\"id\": 82, \"name\": \"Crime\"}]")

    get(api_v1_movies_path, :params => {:genre => 'comedy'})

    expect(response).to be_successful
    movie = JSON.parse(response.body, symbolize_names: true)

    expect(movie[:data].count).to eq(2)
    expect(movie[:data].first[:attributes][:genres]).to include('Comedy')
  end  
end
