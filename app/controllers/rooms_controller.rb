class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_room, only: [:show, :edit, :update]
  def index
    @rooms = Room.all.order(created_at: 'DESC')
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    unless @room.save
      render :new
    end
  end

  def show
  end

  def edit
    unless user_signed_in? && @room.users.include?(current_user)
      redirect_to root_path
    end
  end

  def update
    unless @room.update(room_params)
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit(:image, :title, :purpose_room, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
