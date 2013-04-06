class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    puts params.inspect
    if params[:photographer] == "Photographer"
      @user.photographer = true
    elsif params[:photographer] == "Client"
      @user.photographer = false
    end

    @user.save

    if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    
  end
end
