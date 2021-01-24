class ChatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @chat = Chat.find(params[:id])
    if ChatUser.where(user_id: current_user.id, chat_id: @chat.id).present?
      @messages = @chat.messages
      @users = @chat.users
    else
      redirect_to root_path
    end
  end
  def create
    @chat = Chat.create(theme: "Message")
    @chat_user1 = ChatUser.create(chat_id: @chat.id, user_id: current_user.id)
    @chat_user2 = ChatUser.create(chat_user_params)
    redirect_to chat_path(@chat)
  end
  private
  def chat_user_params
    params.require(:chat_user).permit(:user_id, :chat_id).merge(chat_id: @chat.id)
  end
end
