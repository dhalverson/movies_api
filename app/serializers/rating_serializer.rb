class RatingSerializer
  include JSONAPI::Serializer
  attributes :user_id, :rating, :timestamp, :movie_id

  belongs_to :movie
end
