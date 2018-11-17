class ArtistsController < ApplicationController
  before_action :set_artist, except: [:index, :new, :create]
  
  def index
    @artists = Artist.all
  end

  def show
    @songs = @artist.songs
    #loop through that in the show page
  end

  def new
    @artist = Artist.new
    render partial: "form"
  end

  def create
    @artist = Artist.new(sub_params)
    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end


  def edit
    render partial: "form"
  end

  def update
    if @artist.update(artist_params)
      redirect_to artists_path
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artist_path
  end
  private
  def set_artist
    @artist = Artist.find(params[:id])
  end
end

