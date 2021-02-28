class MovieSerializer
  include JSONAPI::Serializer
  attributes :imdb_id, :title, :genres, :release_date, :budget
end
