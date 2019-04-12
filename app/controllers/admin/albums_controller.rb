class Admin::AlbumsController < ApplicationController
  before_action :set_albums, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def edit
  end
  
  def show
  end

  
  def create
    @album = Album.new(song_albums)
    if @album.save
      redirect_to admin_album_path(@album), notice: 'Album was successfully created.'
    else
      render :new
    end
  end

  def update
    @album = SongAlbumfind(params[:id])
    if @album.update(song_albums)
      redirect_to admin_album_path(@album), notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to admin_albums_path, notice: 'Album was successfully destroyed.'
  end

  private
  def set_albums
    @album = Album.find(params[:id])
  end

  def song_albums
    params.require(:album).permit(:title ,:rating)
  end
end
