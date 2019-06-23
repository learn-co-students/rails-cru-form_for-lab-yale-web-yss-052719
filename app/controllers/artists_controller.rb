class ArtistsController < ApplicationController
    def show
        set_artist 
    end

    def new
    end

    def create
        artist = Artist.create(artist_params)
        redirect_to artist_path(artist)
    end

    def edit
        set_artist
    end

    def update
        artist = Artist.update(artist_params)
        redirect_to artist_path(artist)
    end

    private
    def set_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
end
