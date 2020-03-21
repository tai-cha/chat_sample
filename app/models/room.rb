class Room < ApplicationRecord
  has_many :room_posts

  def self.object_names
    %i[text]
  end

  object_names.each do |name|
    has_many name, through: :room_posts, source: :postable,
             source_type: "Post::#{name.to_s.singularize.camelize(:upper)}", dependent: :destroy
  end

  def self.correct_type?(type)
    object_names.include?(type)
  end
end
