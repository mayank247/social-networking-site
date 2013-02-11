class LikeCommentsController < ApplicationController

	def new
		@comment = Comment.find(params[:comment_id])
		@comment.likes.create(:user_id => current_user.id)
    redirect_to status_update_path(@comment)
	end
  
end
