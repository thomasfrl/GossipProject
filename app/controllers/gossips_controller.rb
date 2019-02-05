class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
   

    @gossip = Gossip.new() # avec xxx qui sont les données obtenues à partir du formulaire
    @gossip.title = params[:title]
    @gossip.content = params[:content]
    @gossip.user = User.first
    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to action: :index
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