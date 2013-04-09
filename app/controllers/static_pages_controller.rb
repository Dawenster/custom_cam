class StaticPagesController < ApplicationController
  def index
    if current_user
      if current_user.photographer == false #client
        redirect_to user_path(current_user)  
      else
        redirect_to categories_path #photographer
      end
    else
      @last_photo = Photo.find(5).url #Photo.last.url if Photo.last #Landing Page Pic
    end
  end

  def about
  end
end
