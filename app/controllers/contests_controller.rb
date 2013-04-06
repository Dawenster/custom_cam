class ContestsController < ApplicationController
  def index
  end

  def show
    @contest = Contest.find(params[:id])
    @photos = Photo.where('contest_id =?', params[:id])
  end

  def new
    @contest = Contest.new
    @categories = Category.all
  end

  def create
    @contest = Contest.new(:title => params[:contest][:title],
                           :description => params[:contest][:description],
                           :price => params[:contest][:price].to_i,
                           :category_id => params[:contest][:category],
                           :creator_id => current_user.id)

    if @contest.save
      redirect_to contest_path(@contest)
    else
      flash.now[:alert] = @contest.errors.full_messages.join(",")
      @categories = Category.all
      render :new
    end
  end
end
