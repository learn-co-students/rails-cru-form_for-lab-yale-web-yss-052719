class GenresController < ApplicationController
    def index
        @genres = Genre.all
        render "/genres/index.html.erb"
    end

    def show
        @genre = Genre.find_by(id: params["id"])
        render "/genres/show.html.erb"
    end

    def new
        @genre = Genre.new
        render "/genres/new.html.erb"
    end

    def create
        @genre = Genre.create(params.require(:genre).permit(:name))
        redirect_to("/genres/#{@genre.id}")
    end

    def edit
        @genre = Genre.find_by(id: params["id"])
        render "/genres/edit.html.erb"
    end

    def update
        @genre = Genre.find_by(id: params["id"])
        @genre.update(params.require(:genre).permit(:name))
        redirect_to("/genres/#{@genre.id}")
    end
end