class Movie < ApplicationRecord
  serialize :genres, Array
  
  has_many :ratings
end
