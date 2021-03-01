class Api::V1::MoviesController < ApplicationController
  # Logic to handle if multiple params are included
  def index
    if params[:page]
      movies = Movie.paginate(page: movie_params[:page], per_page: 5)
    else
      movies = Movie.paginate(page: 1, per_page: 5)
    end
    render json: MovieSerializer.new(movies)
  end

  def show
    movie = Movie.find(movie_params[:id])
    render json: MovieDetailSerializer.new(movie)
  end

  private

  def movie_params
    params.permit(:id, :page)
  end
end
