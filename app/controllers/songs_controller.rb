class SongsController < ApplicationController

  before_action :song_called;
  before_action :set_chart, only: [:show, :edit, :update, :destroy]

  def index
    @songs= @song_called.songs
  end

  def show
    @songs = @chart.songs.all
  end

  def new
    @song = @chart.songs.new
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

protected
  def song_called
    @song_called ||=
    if params[:chart_id]
      Chart.find(params[:chart_id])
    else params[:artist_id]
      Artist.find(params[:artist_id])
    end
 end

    private

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end
    
    def chart_params
      params.require(:chart).permit(:name)
    end

    def chart
      @chart = Chart.find(params[:chart_id])
    end
end

