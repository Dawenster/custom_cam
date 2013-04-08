module ApplicationHelper
  def user_photo_rating(photo)
    current_user.ratings.select { |rating| rating.photo == photo } if current_user
  end
end
