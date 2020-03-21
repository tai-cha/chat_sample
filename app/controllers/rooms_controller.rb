class RoomsController < ApplicationController
  def index
    @rooms = Room.all.reverse
  end

  def show
    @room = Room.includes(room_posts: :postable).find(params[:id])
  end

  def create
    room = Room.new(room_params)
    if room.save
      redirect_to room_path(room)
    else
      flash[:danger] = 'ルーム作成に失敗しました'
      redirect_to root_path
    end
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
