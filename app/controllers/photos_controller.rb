class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    p = Photo.new
    p.url = params[:file]
    p.user_id = current_user.id
    p.save!

    Cloudinary::Uploader.upload(params[:file][:filename], :public_id => 'mcchillinstaburger29323')

  end

  def edit
    # Edit a photo's description
  end

  def update
  end

  def show
    @photos = Photo.all
  end

end
