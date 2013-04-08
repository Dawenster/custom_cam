module ApplicationHelper
  def user_photo_rating(photo)
    if current_user
      return nil if current_user.ratings.select { |rating| rating.photo == photo }.empty?
      current_user.ratings.select { |rating| rating.photo == photo }
    end
  end
end
