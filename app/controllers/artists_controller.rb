class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
    render :index
  end

  def new
    @artist = Artist.new
    render :new
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.create(artists_params)
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = Artist.find(params[:id])
    render :edit
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artists_params)
    redirect_to artists_path
  end




  private
  def artists_params
    params.require(:artist).permit(:name, :bio)
  end

end
