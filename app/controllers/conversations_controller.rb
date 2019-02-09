class ConversationsController < ApplicationController
  before_action :authenticate_user

  def index
    @conversations = current_user.conversations
  end

  def new
    @users = User.all.reject{|user| user == current_user}
  end

  def create 
    conversation = Conversation.new() # avec xxx qui sont les données obtenues à partir du formulaire
    conversation.participant1 = current_user
    conversation.participant2 = User.find(params[:recipient])
    if conversation.already_exist?
      conversation = Conversation.find(conversation.already_exist?[1])
      sent_message(params[:content],conversation).save
      flash[:success] = "Conversation déjà existante"
      redirect_to conversation_path(conversation.id)
    else
      if conversation.save # essaie de sauvegarder en base @gossip
        flash[:success] = "Nouvelle conversation créée"
        sent_message(params[:content],conversation).save
        redirect_to conversation_path(conversation.id)
      else
        msg = "<p>Nous n'avons pas créer à la conversation pour la (ou les) raison(s) suivante(s) :</p><hr><ul>"
        conversation.errors.full_messages.each do |message|
          msg = msg + "<li>" + message + "</li>"
        end
        flash.now[:danger] =  msg + "</ul>"
        render :new
      end
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.private_messages.order(:id)
    @participant = participant(@conversation)
  end

  def participant(conversation)
    if conversation.participant1 == current_user
      return conversation.participant2
    else
      return conversation.participant1
    end    
  end

  private

  def sent_message(content,conversation)
    private_message = PrivateMessage.new() # avec xxx qui sont les données obtenues à partir du formulaire
    private_message.sender = current_user
    private_message.content = content
    private_message.conversation = conversation
    return private_message
  end
end