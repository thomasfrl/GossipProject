class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def valid_user
    unless current_user == Gossip.find(params[:id]).user
      flash[:danger] = "Vous ne pouvez pas modifier ou supprimer un élément que vous n'avez pas créé."
      redirect_back(fallback_location: root_path)
    end
  end

  def valid_user_comment
    unless current_user == Comment.find(params[:id]).user
      flash[:danger] = "Vous ne pouvez pas modifier ou supprimer un élément que vous n'avez pas créé."
      redirect_back(fallback_location: root_path)
    end
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
