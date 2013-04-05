class ContestsController < ApplicationController
  def index
  end

  def show
    @contest = Contest.find(params[:id])
    @photos = Photo.where('contest_id =?', params[:id])
  end
end
