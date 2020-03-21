class Room < ApplicationRecord
  object_names = %i[text]
  has_many :room_posts
  object_names.each do |name|
    has_many name, through: :room_posts, source: :postable,
             source_type: "Post::#{name.to_s.singularize.camelize(:upper)}", dependent: :destroy
  end
end
