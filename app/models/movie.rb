class Movie < ApplicationRecord
  # serialize :genres, Array
  
  has_many :ratings

  # This logic should live in the model, but having issues getting it to show in serializer
  def average_rating
    if ratings.blank?
      'No Ratings Available!'
    else
      (ratings.map(&:rating).sum / ratings.size).round(2)
    end
  end
end
