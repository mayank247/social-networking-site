class CommentsController < ApplicationController
	def create
    @status_update = StatusUpdate.find(params[:status_update_id])
    @comment = @status_update.comments.create(params[:comment])
    redirect_to status_update_path(@status_update)
  end
  
  def destroy
    @status_update = StatusUpdate.find(params[:status_update_id])
    @comment = @status_update.comments.find(params[:id])
    @comment.destroy
    redirect_to status_update_path(@status_update)
  end
end
