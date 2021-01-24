class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    ActionCable.server.broadcast 'message_channel', message: @message.template if @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
