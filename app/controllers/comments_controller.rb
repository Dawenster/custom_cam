class CommentsController < ApplicationController
  def create
    @contest = Contest.find(params[:contest_id])
    @comment = @contest.comments.build(:content => params[:comment][:content])
    @comment.user = current_user

    if @comment.save
      render :json => {:comment => @comment, :user => current_user }
    else
      render :json => @comment.errors.full_messages.join(","),
                      :status => :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render :json => {}
  end
end
