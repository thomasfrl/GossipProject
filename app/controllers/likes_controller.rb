class LikesController < ApplicationController
  before_action :authenticate_user
  before_action :valid_user_like

  def create
    like = Like.new
    if params[:comment_id]
      like.comment = Comment.find(params[:comment_id])
    else
      like.comment = Gossip.find(params[:gossip_id])
    end
    like.save
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
  end
end