class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy, :update, :edit]
  before_action :valid_user_comment, only: [:destroy, :update, :edit]

  def create
    gossip = params[:gossip_id]
    comment = params[:comment_id]

    if comment == nil
      type = "Gossip"
      id = gossip
    else
      type = "Comment"
      id =  comment
    end
    @comment = Comment.create(content: params[:content], user_id: current_user.id, commentable_type: type, commentable_id: id)
    flash[:success] = 'Creation du commentaire réussi'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Supression du commentaire réussi'
    redirect_back(fallback_location: root_path)
  end

  def update
    @comment = Comment.find(params[:id])
    id = @comment.commentable_id
    unless @comment.commentable_type == "Gossip"
      @comment_parent = Comment.find(id)
      id = @comment_parent.commentable_id
    end

    @comment.content = params[:content]
    @comment.save # essaie de sauvegarder en base @gossip
    flash[:success] = 'Mise à jour du commentaire réussi'
    redirect_to "/gossips/#{id}"

  end

  def edit
    @comment = Comment.find(params[:id])
  end
end
