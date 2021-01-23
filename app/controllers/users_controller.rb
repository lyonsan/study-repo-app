class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @users = User.all.order(created_at: 'DESC')
  end

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms.order(created_at: 'DESC')
  end
end
