class HomeController < ApplicationController
  def index
    if current_user
      @users = User.all
      @friend = Friend.where("user_id=? AND status=?", current_user.id, true)
      items = Array.new
      items.push current_user.id
      @friend.each do |f|
        items.push f.to_user_id
      end
      @status_updates = StatusUpdate.where(:user_id => items).order("created_at DESC")
      @friends = Friend.where("to_user_id=? AND status=?", current_user.id, false)
    end
  end
end
