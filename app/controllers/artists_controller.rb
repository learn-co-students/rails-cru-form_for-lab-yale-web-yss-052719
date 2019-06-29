class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artist_path(@artist)
    #user create an artist with the artist_params -name, bio
    #redirect_to to the artist page after
  end

  def show
    @artist = Artist.find(params[:id])
    #find artist by id, show artist
  end

  def edit
    @artist = Artist.find(params[:id])
    #edit and update comes in pairs
  end

  def update
   #find a specific artist to update by their id
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    #update by entering their name and bio
    redirect_to artist_path(@artist)
    #redirect to show the update
  end

  private

  # creating strong params to pass into #create
  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
