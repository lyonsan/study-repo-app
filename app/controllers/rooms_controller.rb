class RoomsController < ApplicationController
  def index
  end
  def new
    @room = Room.new
  end

  private

  def room_params
    params.require(:room).permit(:image, :title, :user_ids []).merge(user_id: current_user.id)
  end
end
