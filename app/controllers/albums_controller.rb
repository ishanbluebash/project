class AlbumsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  def index
    @q = Album.ransack(params[:q])
    @albums = @q.result(distinct: true).where(published: true)
    params[:tag] ? @albums = Album.tagged_with(params[:tag]) : @Albums = Album.all
  end
  def show
    @album = Album.find(params[:id])
  end
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    
    if @album.save
      redirect_to @album
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to root_path, status: :see_other
  end

  def purge_audio
    @album = Album.find(params[:id])
    @audio = @album.audios.find(params[:audio_id])
    @audio.purge
    redirect_back fallback_location: root_path
  end

  def my_albums
    @q = Album.ransack(params[:q])
    @albums = @q.result(distinct: true).where(published: false)
  end

  private
    def album_params
      params.require(:album).permit(:title, :body, :image, :published, :tag_list, :tag, :tag_ids,{ tag_ids: [] }, audios: [])
    end
end