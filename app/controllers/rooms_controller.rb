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
    render :new unless @room.save
  end

  def show
  end

  def edit
    redirect_to root_path unless user_signed_in? && @room.users.include?(current_user)
  end

  def update
    render :edit unless @room.update(room_params)
  end

  private

  def room_params
    params.require(:room).permit(:image, :title, :purpose_room, user_ids: [])
  end

  def set_room
    @room = Room.find(params[:id])
  end
end
