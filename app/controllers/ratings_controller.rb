class RatingsController < ApplicationController
  def create
    values = params[:data].split(',')
    rating = Rating.new(:value => values[0], :photo_id => values[1])
    if rating.save
      ratings = rating.photo.ratings.map { |rating| rating.value }
      average_rating = (ratings.inject{ |sum, el| sum + el }.to_f / ratings.size).round
      render :json => { :avg => average_rating, :id => values[1]}
    else
      render :json => { :message => "Totally failed..." }
    end
  end

  def update
    
  end

  def destroy
    
  end

end
