json.name @room.name
json.messages do |json|
  json.partial!(partial: 'post', collection: @room.room_posts, as: :post)
end
