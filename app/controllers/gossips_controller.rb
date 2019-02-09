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
      flash[:success] = "Nouveau potin créé"
      redirect_to gossips_path
    else
      @tags = Tag.all
      @users = User.all
      msg = "<p>Nous n'avons pas créer à modifier le potin pour la (ou les) raison(s) suivante(s) :</p><hr><ul>"
      @gossip.errors.full_messages.each do |message|
        msg = msg + "<li>" + message + "</li>"
      end
      flash.now[:danger] =  msg + "</ul>"
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
    flash[:success] = 'Supression du potin réussi'
    redirect_to gossips_path

  end

  def update
    @gossip = Gossip.find(params[:id])
    @gossip.title = params[:title]
    @gossip.content = params[:content]

    if @gossip.save # essaie de sauvegarder en base @gossip
      @gossips = Gossip.order(:id)
      flash[:success] = 'Mise à jour du potin réussi'
      redirect_to gossips_path
    else
      @users = User.all
      msg = "<p>Nous n'avons pas réussi à modifier le potin pour la (ou les) raison(s) suivante(s) :</p><hr><ul>"
      @gossip.errors.full_messages.each do |message|
        msg = msg + "<li>" + message + "</li>"
      end
      flash.now[:danger] =  msg + "</ul>"
      render :edit
    end

  end

  def edit
    @gossip = Gossip.find(params[:id])
    @users = User.all
  end


end