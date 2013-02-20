class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def create
    @status_update = StatusUpdate.find(params[:status_update_id])
    @comment = @status_update.comments.create(params[:comment])
    #redirect_to status_update_path(@status_update)
  end
  
  def destroy
    @comment = current_user.comments.where(:id => params[:id])[0]
    @status_update = @comment.status_update
    if @status_update.user_id == current_user.id
        @comment.destroy
    else
      flash[:error] = "You don't have permission to delete this comments"
    end
    redirect_to status_update_path(@status_update)
  end
end
