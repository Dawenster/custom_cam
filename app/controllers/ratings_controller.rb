class RatingsController < ApplicationController
  def create
    values = params[:data].split(',')
    rating = Rating.new(:value => values[0], :photo_id => values[1], :user_id => current_user.id)
    if rating.save
      ratings = rating.photo.ratings.map { |rating| rating.value }
      average_rating = (ratings.inject{ |sum, el| sum + el }.to_f / ratings.size)
      render :json => { :avg => average_rating.round, :id => values[1], :unround => average_rating }
    else
      render :json => { :message => "Totally failed..." }
    end
  end

  def update
    
  end

  def destroy
    
  end

end
