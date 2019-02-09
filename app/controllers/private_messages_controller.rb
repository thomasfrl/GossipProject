class PrivateMessagesController < ApplicationController
  before_action :authenticate_user

  def create
    @private_message = PrivateMessage.new() # avec xxx qui sont les données obtenues à partir du formulaire
    @private_message.sender = current_user
    @private_message.content = params[:content]
    @private_message.conversation = Conversation.find(params[:conversation_id])
    if @private_message.save # essaie de sauvegarder en base @gossip
      flash[:success] = "Message envoyé"
      redirect_to conversation_path(params[:conversation_id])
    else
      msg = "<p>Nous n'avons pas envoyer le message pour la (ou les) raison(s) suivante(s) :</p><hr><ul>"
      @private_message.errors.full_messages.each do |message|
        msg = msg + "<li>" + message + "</li>"
      end
      flash[:danger] =  msg + "</ul>"
      redirect_to conversation_path(params[:conversation_id])
    end

  end

end
