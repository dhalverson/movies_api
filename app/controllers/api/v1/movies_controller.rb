class Api::V1::MoviesController < ApplicationController
  # Logic to handle if multiple params are included
  # movies = Movie.where('release_date LIKE ?', "#{movie_params[:year]}%").paginate(page: page, per_page: 5)
  def index
    page = movie_params[:page] || 1
    @movie = Movie.where(nil)
    movies = @movie.paginate(page: page, per_page: 5)
    movies = @movie.filter_by_release_date(movie_params[:year]).paginate(page: page, per_page: 5) if movie_params[:year].present?
    render json: MovieSerializer.new(movies)
  end

  def show
    movie = Movie.find(movie_params[:id])
    render json: MovieDetailSerializer.new(movie)
  end

  private

  def movie_params
    params.permit(:id, :page, :year)
  end
end
