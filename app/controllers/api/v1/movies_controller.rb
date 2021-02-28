class Api::V1::MoviesController < ApplicationController
  def index
    if params[:page]
      movies = Movie.paginate(page: params[:page], per_page: 5)
    else
      movies = Movie.paginate(page: 1, per_page: 5)
    end
      render json: MovieSerializer.new(movies)
  end

  def show
    movie = Movie.find(params[:id])
    render json: MovieSerializer.new(movie)
  end
end
