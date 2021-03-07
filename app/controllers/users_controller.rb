class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_user, only: [:show, :library]
  
  def index
    @users = User.all.order(created_at: 'DESC')
  end

  def show
    @rooms = @user.rooms.order(created_at: 'DESC')
    if user_signed_in?
      @chats = current_user.chats.order(created_at: 'DESC')
      @chat_id = (@user.chat_users.pluck(:chat_id) & current_user.chat_users.pluck(:chat_id)).first
      unless @chat_id
        @chat = Chat.new
        @chat_user = ChatUser.new
      end
    end
  end

  def library
    @articles = @user.articles
    @like_articles = @user.like_articles 
  end

  def search
    @users = User.search(params[:keyword], params[:study_genre_id]).order(created_at: 'DESC')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
