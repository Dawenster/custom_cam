class ContestsController < ApplicationController
  def index
  end

  def show
    @contest = Contest.find(params[:id])
    @time_left = @contest.created_at + (@contest.duration * 86400) - Time.now
    @photos = Photo.where('contest_id =?', params[:id])
    @winning_photo = Photo.find(@contest.winning_photo_id) if @contest.winning_photo_id
    @comments = @contest.comments
  end

  def new
    unless current_user
      flash[:alert] = "You must be logged in to create a contest."
      redirect_to new_session_path
    end

    if current_user.photographer
      redirect_to root_path
    end

    @contest = Contest.new
    @categories = Category.all
  end

  def create
    puts params.inspect
    @contest = Contest.new(:title => params[:contest][:title],
                           :description => params[:contest][:description],
                           :price => params[:contest][:price].to_i,
                           :category_id => params[:contest][:category],
                           :creator_id => current_user.id,  
                           :duration => params[:duration])

    if @contest.save
      time = @contest.duration * 100
      # scheduler.in( (Time.now + time).to_s + "s") do
      #   UserMailer.creator_reminder(@contest.user, @contest.id)
      # end
      redirect_to contest_path(@contest)
    else
      flash.now[:alert] = @contest.errors.full_messages.join(",")
      @categories = Category.all
      render :new
    end
  end

  def update
    photo = Photo.find(params[:photo])
    contest = photo.contest
    contest.update_attributes(:winning_photo_id => photo.id)
    UserMailer.(photo.user
    render :json => { :contest => contest }
  end
end
