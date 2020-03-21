class PostsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    if Room.correct_type?(params[:postable_type].to_sym)
      room.send(params[:postable_type]).create(post_params)
      ActionCable.server.broadcast("room_#{params[:room_id]}",
                                   body: {
                                     type: params[:postable_type],
                                     content: post_params[:content]
                                   }.to_json)
      render json: { result: 'OK' }
    else
      render json: { result: 'error', params: params }
    end
  end

  private

  def post_params
    params.require('post').permit(
      :content
    )
  end
end
