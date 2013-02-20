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
    @comment = @status_update.comments
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status_update }
    end
  end

  def new
    @status_update = StatusUpdate.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status_update }
    end
  end

  def create
    @status_update = StatusUpdate.new(params[:status_update])
    @status = @status_update.save
    
    unless @status
      render :index, :notice => "Message cannot be empty!"
    end
  end

  def destroy
    @status_update = StatusUpdate.where("id=? AND user_id=?", params[:id], current_user.id)[0]
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
