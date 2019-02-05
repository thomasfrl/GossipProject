class GossipsController < ApplicationController
  def new
    @users = User.all
    @gossip = Gossip.new
  end

  def create
    @users = User.all
    @gossip = Gossip.new() # avec xxx qui sont les données obtenues à partir du formulaire
    @gossip.title = params[:title]
    @gossip.content = params[:content]
    @gossip.user = User.find(params[:author])
   
    if @gossip.save # essaie de sauvegarder en base @gossip
      render :index
    else
      render :new
    end
    
  end
 
  def show
    id = params[:id]
    @gossip = Gossip.find(id.to_i)
  end
  
  def index
  end
end