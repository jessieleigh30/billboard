class SongsController < ApplicationController

  #before action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @charts = Chart.find(params[:chart_id])
    @songs = @artist.songs.all
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
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @song.update(song_params)
      redirect_to artist_song_path
    else 
      render :edit
    end
  end

    private

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def chart
      @chart = Chart.find(params[:artist_id])
    end
end

