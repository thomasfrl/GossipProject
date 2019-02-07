class LikesController < ApplicationController
  before_action :authenticate_user
  #before_action :valid_user_like

  def create
    like = Like.new
    liked = false
    if params[:comment_id]
      comment_id = params[:comment_id]
      if alreadyliked?(comment_id)[0]
        liked = true
      end
      like.comment = Comment.find(comment_id)
    else
      gossip_id = params[:gossip_id]
      if alreadyliked?(gossip_id)[1]
        liked = true
      end
      like.gossip = Gossip.find(params[:gossip_id])
    end
    if liked == false
      like.user = current_user
      like.save
      flash[:alert] = 'Like bien pris en compte'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = 'Vous avez déjà liké le contenu'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    liked = false
    like = Like.new
    if params[:comment_id]
      if alreadyliked?(params[:comment_id])[0]
        liked = true
        current_user.likes.select{|li| li.comment_id != nil}.each do |l|
          if l.comment.id == params[:comment_id].to_i
            like = l
          end
        end
      end
    else
      if alreadyliked?(params[:gossip_id])[1]
        liked = true
        current_user.likes.select{|li| li.gossip_id != nil}.each do |l|
          if l.gossip.id == params[:gossip_id].to_i
            like = l
          end
        end
      end
    end
    if liked == false
      flash[:danger] = "Vous ne pouvez pas unliké car vous n'avez pas encore liké"
      redirect_back(fallback_location: root_path)
    else
      like.destroy
      flash[:alert] = 'Like bien supprimé'
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def alreadyliked?(id) #vérifie que le current user n'a pas déjà liké ce commentaire 
    comment_ids =[]
    gossip_ids =[]
    comment = false
    gossip = false
    current_user.likes.each do |like| 
      comment_ids << like.comment_id
      gossip_ids << like.gossip_id
    end

    if comment_ids.include?(id.to_i)
      comment = true
    end
    if gossip_ids.include?(id.to_i)
      gossip = true
    end
    return [comment,gossip]
  end
end