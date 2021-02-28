class MovieSerializer
  include JSONAPI::Serializer
  attributes :imdb_id, :title, :release_date
  
  # Would need to consider if these attributes would ever be nil
  attribute :genres do |object|
    genre_array = JSON.parse(object[:genres], symbolize_names: true)
    genre_array.map do |genre|
      genre[:name]
    end
  end

  attribute :budget do |object|
    "$#{object.budget}"
  end
end
