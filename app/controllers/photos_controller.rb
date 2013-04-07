class PhotosController < ApplicationController

  def new
    if !current_user.photographer
      redirect_to root_path
    end
    
    @photo = Photo.new

  end

  def create
    p = Photo.new
    p.url = params[:file]
    p.contest_id = params[:contest_id]
    p.user_id = current_user.id
    p.description = params[:description]
    p.save!

    # Cloudinary::Uploader.upload(params[:file]) WOW WE TOTALLY DONT NEED THIS WOW
    redirect_to contest_path(p.contest)
  end

  def edit
    # Edit a photo's description
  end

  def update
  end

  def show
    @photo = Photo.find(params[:id])
  end

end
