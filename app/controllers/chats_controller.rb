class ChatsController < ApplicationController
  before_action :authenticate_user!
  def show
    @chat = Chat.find(params[:id])
    if ChatUser.where(user_id: current_user.id, chat_id: chat.id).present?
      @messages = @chat.messages
      @chat_users = @chat.chat_users
    else
      redirect_to root_path
    end
  end
end
