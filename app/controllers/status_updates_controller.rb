class StatusUpdatesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @friend = Friend.where("user_id=? AND status=?", current_user.id, true)
    items = Array.new
    items.push current_user.id
    @friend.each do |f|
      items.push f.to_user_id
    end
    @status_update = StatusUpdate.new
    @status_updates = StatusUpdate.where(:user_id => items).order("created_at DESC")
  end

  def show
    @status_update = StatusUpdate.find(params[:id])
  end

  def new
    @status_update = StatusUpdate.new
  end

  def create
    @status_update = StatusUpdate.new(params[:status_update])
    if @status_update.save
    
    else
    
    end
  end

  def destroy
    @status_update = current_user.status_updates.where("id=?", params[:id])[0]
    if @status_update.present?
      @status_update.destroy
    else
      flash[:error] = "You don't have permission to delete this post."
    end

    respond_to do |format|
      format.html { redirect_to status_updates_url }
      format.json { head :no_content }
    end
  end
end
