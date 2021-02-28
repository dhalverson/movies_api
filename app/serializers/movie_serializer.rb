class MovieSerializer
  include JSONAPI::Serializer
  attributes :imdb_id, :title, :genres, :release_date
  
  attribute :budget do |object|
    "$#{object.budget}"
  end
end
