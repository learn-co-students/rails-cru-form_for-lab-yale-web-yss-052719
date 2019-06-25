class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
        render "/artists/index.html.erb"
    end

    def show
        @artist = Artist.find_by(id: params["id"])
        render "/artists/show.html.erb"
    end

    def new
        @artist = Artist.new
        render "/artists/new.html.erb"
    end

    def create
        @artist = Artist.create(params.require(:artist).permit(:name, :bio))
        redirect_to("/artists/#{@artist.id}")
    end

    def edit
        @artist = Artist.find_by(id: params["id"])
        render "/artists/edit.html.erb"
    end

    def update
        @artist = Artist.find_by(id: params["id"])
        @artist.update(params.require(:artist).permit(:name, :bio))
        redirect_to("/artists/#{@artist.id}")
    end
end