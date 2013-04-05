class ContestsController < ApplicationController
  def index
  end

  def show
    @contest = Contest.find(params[:id])
    @photos = Photo.where('contest_id =?', params[:id])
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(:title => params[:contest][:title],
                           :description => params[:contest][:description],
                           :price => params[:contest][:price].to_i,
                           :category_id => 1, # TODO: THIS IS HARDCODED
                           :creator_id => 1)

    if @contest.save
      redirect_to contest_path(@contest)
    else
      flash.now[:alert] = @contest.errors.full_messages.join(",")
      render :new
    end
  end
end
