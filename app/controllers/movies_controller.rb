class MoviesController < ApplicationController
  # wrap_parameters format: []
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    movies = Movie.all
    render json: movies
  end

  def create
    render json: Movie.create(movie_params), status: :created
    # byebug
  end

  private

  def movie_params
    params.permit(:title, :year, :length, :director, :description, :poster_url, :category, :discount, :female_director)
  end

  def render_not_found_response
    render json: { error: "Movies not found" }
  end
end
