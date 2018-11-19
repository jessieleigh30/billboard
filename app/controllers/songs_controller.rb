class SongsController < ApplicationController

  before_action :song_called
  before_action :set_chart, except: [:index, :new, :create]
  
 
  def index
    @songs= @song_called.songs
    @charts= Chart.all
  end

  def show
    @song = @chart.songs.all
  end

  def new
   @song = Song.new
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
    render :new
  end

  def update
    if @song.update(song_params)
      redirect_to artist_songs_path
    else 
      render :edit
    end

    def destroy
      @song.destroy
      redirect_to board_songs_path
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
    def set

    def set_song
      @song = Song.find(params[:id])
    end

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

