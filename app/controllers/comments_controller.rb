class CommentsController < ApplicationController

  def create
    commit = params[:commit]
    if commit =~ /potin/
      @comment = Comment.create(content: params[:content], user_id: User.all.ids.sample,commentable_type: Gossip.name, commentable_id: commit.split[-1])
    else
      @comment = Comment.create(content: params[:content], user_id: User.all.ids.sample,commentable_type: Comment.name, commentable_id: commit.split[-1])
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
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
    redirect_to "/gossips/#{id}"

  end

  def edit
    @comment = Comment.find(params[:id])
  end
end
