require 'rails_helper'

RSpec.describe 'Movies API' do
  it 'Sends a list of all movies' do
    create_list(:movie, 10)
    get(movies_path)

    expect(response).to be_successful
    movies = JSON.parse(response.body, symbolize_names: true)

    require 'pry'; binding.pry
  end
end