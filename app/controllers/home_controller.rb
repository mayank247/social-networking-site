class HomeController < ApplicationController
  def index
    @users = User.all
    @status_updates = StatusUpdate.order("created_at DESC").all
    @friends = Friend.where("to_user_id=? AND status=?", current_user.id, false)
  end
end
