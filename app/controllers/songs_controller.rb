class SongsController < ApplicationController

  before action 
  def index
    @songs = @songs.artists
  end

  def show
  end

  def new
    @song = @artist.songs.new
    render partial: "form"
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_songs_path
    else
      render :new

  def edit
    render partial: "form"
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path
    if
end

private

def set_artist
  @artist = Artist.find(params[:artist_id])
end

def chart
  @chart = Chart.find(params[:artist_id])
end