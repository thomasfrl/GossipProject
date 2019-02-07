class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create, :destroy, :update, :edit]
  before_action :valid_user, only: [:destroy, :update, :edit]

  def new
    @tags = Tag.all
    @users = User.all
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new() # avec xxx qui sont les données obtenues à partir du formulaire
    @gossip.title = params[:title]
    @gossip.content = params[:content]
    @gossip.user = current_user
    @gossip.tags << Tag.find(params[:tag])

    if @gossip.save # essaie de sauvegarder en base @gossip
      @gossips = Gossip.all
      render :index
    else
      @tags = Tag.all
      @users = User.all
      render :new
    end
    
  end
 
  def show
    @gossip = Gossip.find(params[:id])
    @user = @gossip.user
    @city = @user.city
    @comments = @gossip.comments
    @comment = Comment.new
    @tags = @gossip.tags

  end
  
  def index
    @gossips = Gossip.order(:id)
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:alert] = 'Supression du potin'
    redirect_to gossips_path

  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.title = params[:title]
    @gossip.content = params[:content]

    if @gossip.save # essaie de sauvegarder en base @gossip
      @gossips = Gossip.order(:id)
      render :index  
    else
      @users = User.all
      render :edit
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
    @users = User.all
  end


end