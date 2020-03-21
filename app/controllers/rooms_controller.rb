class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.includes(:room_posts).find(params[:id])
  end
end
