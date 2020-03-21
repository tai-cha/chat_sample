class RoomPost < ApplicationRecord
  belongs_to :room
  belongs_to :postable, polymorphic: true

  def type
    postable_type.to_s.gsub('Post::', '').underscore
  end
end
