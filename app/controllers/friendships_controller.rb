class FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.pending
  end

  def show
    @friendship = Friendship.find(params[:id])
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new
    @friendship.user_id = current_user.id
    @friendship.friend_id = params[:friend_id]
    @friendship.accepted = false

    if @friendship.save
      render json: @friendship, status: :created, location: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @friendship = Friendship.find(user_id: current_user.id, friend_id: params[:friend_id])
    @friendship.destroy
  end

  def accept 
    @friendship = Friendship.find(params[:id])
    @friendship.accepted = true
    if @friendship.save            
      flash.now[:notice] = "Friendship accepted!"  
    else
      flash.now[:alert] = "Something went wrong!"
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:id, :friend_id)
  end
end
