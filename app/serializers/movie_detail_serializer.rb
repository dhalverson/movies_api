class MovieDetailSerializer
  include JSONAPI::Serializer
  attributes :imdb_id, :title, :release_date, :budget, :runtime, :genres, :production_companies
 
  attribute :description do |object|
    object[:overview]
  end

  # If covers if a movie has no ratings(Movie id 16)
  attribute :average_rating do |object|
    if object.ratings.blank?
      'No Ratings Available!'
    else
      object.average_rating
    end
  end

  attribute :genres do |object|
    genre_array = JSON.parse(object[:genres], symbolize_names: true)
    genre_array.map do |genre|
      genre[:name]
    end
  end

  # Language attribute was blank, would need to clarify what we'd want to display here
  attribute :original_language do |object|
    if object[:language] 
      object[:language]
    else
      'N/A'
    end
  end

  attribute :production_companies do |object|
    company_array = JSON.parse(object[:production_companies], symbolize_names: true)
    company_array.map do |company|
      company[:name]
    end
  end
end
