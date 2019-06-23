class GenresController < ApplicationController
    def show
        set_genre 
    end

    def new
    end

    def create
        genre = Genre.create(genre_params)
        redirect_to genre_path(genre)
    end

    def edit
        set_genre
    end

    def update
        genre = Genre.update(genre_params)
        redirect_to genre_path(genre)
    end

    private
    def set_genre
        @genre = Genre.find(params[:id])
    end

    def genre_params
        params.require(:genre).permit(:name, :bio)
    end
end
