class FriendshipsController < ApplicationController

  def index
    @friendships = Friendship.all
  end

  def show
    @friendship = Friendship.find(params[:id])
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new
    @friendship.user_id = params[:user_id]
    @friendship.friend_id = params[:friend_id]
    @friendship.accepted = false

    if @friendship.save
      render json: @friendship, status: :created, location: @friendship
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
