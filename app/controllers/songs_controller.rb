class SongsController < ApplicationController

  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  
 
  def index
    @songs= @artist.songs.all
  end

  def show
  end

  def new
   @song = @artist.songs.new
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

    def song_params
      params.require(:song).permit(:title, :album)
    end
end



