class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid email or password"
      @user = User.new
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:id)
    redirect_to root_path
  end
end
