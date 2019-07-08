class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :edit, :update]

  def new
    @genre = Genre.new
  end

  def show
  end

  def create
    genre = Genre.create(genre_params)
    redirect_to genre_path(genre)
  end

  def edit
  end

  def update
    @genre.update(genre_params)
    redirect_to genre_path(@genre)
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
  def set_genre
    @genre = Genre.find(params[:id])
  end
end
