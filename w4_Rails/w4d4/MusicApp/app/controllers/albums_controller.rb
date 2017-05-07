class AlbumsController < ApplicationController
  def create
    @album = Album.create(album_params)
    redirect_to bands_url
  end

  def new
    render :new
  end

  def edit
    @album = Album.find_by(id: params[:id])
    render :edit
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def update
    @album = Album.find_by(id: params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @band = @album.band
    @album.destroy
    redirect_to band_url(@band)
  end

  private
  def album_params
    params.require(:album).permit(:name)
  end
end
