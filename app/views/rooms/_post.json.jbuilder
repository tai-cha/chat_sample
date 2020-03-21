json.type post.type
case post.type
when 'text'
  json.content post.postable.content
end
