class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    # Upload a photo and save record to DB
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
