class Rating < ApplicationRecord
  validates :rating, presence: true
  validates :movie_id, presence: true
  
  belongs_to :movie
end
