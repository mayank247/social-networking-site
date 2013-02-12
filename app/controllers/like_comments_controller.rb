class LikeCommentsController < ApplicationController

	def new
		@status_update = StatusUpdate.find(params[:status_update_id])
		@comment = Comment.find(params[:comment_id])
		@comment.likes.create(:user_id => current_user.id)
    redirect_to status_update_path(@status_update)
	end
  
end
