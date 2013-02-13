class FriendsController < ApplicationController
	before_filter :authenticate_user!
  # GET /friends
  # GET /friends.json
  def index
    @users = User.all
		@friende = Friend.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.json
  def new
    @friend = Friend.new
		@users = User.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # POST /friends
  # POST /friends.json
  def create
		
    @friend = Friend.new(params[:friend])
		
    respond_to do |format|
      if @friend.save
				
				if @friend.status == true
					@friende = Friend.where("user_id=? AND to_user_id=?", @friend.to_user_id, @friend.user_id)[0]
					debugger
					#redirect_to friend_path(@friende, :method => :put ) 
				else
					format.html { redirect_to new_friend_path, notice: 'Friend was successfully created.' }
					format.json { render json: new_friend_path, status: :created, location: new_friend_path }
				end
      else
        format.html { render action: "new" }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /friends/1
  # PUT /friends/1.json
  def update
    @friend = Friend.find(params[:id])
		debugger
    respond_to do |format|
      if @friend.update_attributes(:status => true)
        format.html { redirect_to friends_path }
        format.json { head :no_content }
        
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to friends_path }
      format.json { head :no_content }
    end
  end
  
  def confirm
		
  end
end
