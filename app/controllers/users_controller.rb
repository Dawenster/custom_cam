class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if params[:photographer] == "Photographer"
      @user.photographer = true
    elsif params[:photographer] == "Client"
      @user.photographer = false
    end


    if params[:user][:password] == params[:user][:password_confirmation] && @user.save
      session[:id] = @user.id
      UserMailer.welcome_email(@user).deliver
      redirect_to user_path(@user)
    elsif params[:user][:password] != params[:user][:password_confirmation] && User.find_by_email(params[:user][:email])
      flash[:alert] = "Email already exists and password does not match fool"
      redirect_to new_user_path
    elsif params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "Password does not match"
      redirect_to new_user_path
    elsif User.find_by_email(params[:user][:email])
      flash[:alert] = "That email already exists"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
