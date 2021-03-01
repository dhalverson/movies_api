require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
  end

  describe 'relationships' do
    it { should have_many :ratings }
  end

  describe 'methods' do
    it 'Can calculate the average rating' do
      movie = create(:movie)
      movie.ratings.create!(user_id: '1', rating: 4, timestamp: Time.now)
      movie.ratings.create!(user_id: '2', rating: 2.5, timestamp: Time.now)
      movie.ratings.create!(user_id: '3', rating: 3.5, timestamp: Time.now)

      expect(movie.average_rating).to eq(3.33)
    end    

    it 'Returns a message if movie has no ratings' do
      movie = create(:movie)

      expect(movie.average_rating).to eq('No Ratings Available!')
    end
  end
end
