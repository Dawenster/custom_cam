class CategoriesController < ApplicationController
  def index
    if current_user && current_user.photographer == false
      redirect_to user_path(current_user)
    end
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
