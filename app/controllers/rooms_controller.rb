class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

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

  private

  def room_params
    params.require(:room).permit(:image, :title, :purpose_room, user_ids: [])
  end
end
