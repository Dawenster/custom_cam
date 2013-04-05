class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user.create(params[:user])
    redirect_to user_path(@user)
  end
end
