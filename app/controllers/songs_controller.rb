class SongsController < ApplicationController
    def index
        @songs = Song.all
        render "/songs/index.html.erb"
    end

    def show
        @song = Song.find_by(id: params["id"])
        render "/songs/show.html.erb"
    end

    def new
        @song = Song.new
        render "/songs/new.html.erb"
    end

    def create
        @song = Song.create(params.require(:song).permit(:name, :genre_id, :artist_id))
        redirect_to("/songs/#{@song.id}")
    end

    def edit
        @song = Song.find_by(id: params["id"])
        render "/songs/edit.html.erb"
    end

    def update
        @song = Song.find_by(id: params["id"])
        @song.update(params.require(:song).permit(:name, :genre_id, :artist_id))
        redirect_to("/songs/#{@song.id}")
    end
end