class Movie < ApplicationRecord
  attr_accessor :average_rating
  serialize :genres, Array
  
  has_many :ratings

  # Was unsure if this business logic should be handled here, or the Serialzier
  # def self.average_rating
  #   if self.ratings.blank?
  #     'No Ratings Available!'
  #   else
  #     (self.ratings.map(&:rating).sum / self.ratings.size).round(2)
  #   end
  # end
end
