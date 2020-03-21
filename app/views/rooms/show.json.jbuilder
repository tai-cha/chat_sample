json.name @room.name
json.messages do |json|
  json.array! @room.room_posts.each do |post|
    json.type post.type
    case post.type
    when 'text'
      json.content post.postable.content
    end
  end
end
