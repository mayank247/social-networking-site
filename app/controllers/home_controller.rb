class HomeController < ApplicationController
  def index
    @users = User.all
    @status_updates = StatusUpdate.order("created_at DESC").all
  end
end
