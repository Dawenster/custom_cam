class StaticPagesController < ApplicationController
  def index
    if current_user
      if current_user.photographer == false #client
        redirect_to user_path(current_user)  
      else
        redirect_to categories_path #photographer
      end
    else
      @last_photo = Photo.last.url if Photo.last #guest
    end
  end

  def about
  end
end
