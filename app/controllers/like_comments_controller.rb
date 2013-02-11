class LikeCommentsController < ApplicationController

	def new
		@status_update = Comment .find(params[:status_update_id])
		@status_update.likes.create(:user_id => current_user.id)
    redirect_to status_update_path(@status_update)
	end
  
end
