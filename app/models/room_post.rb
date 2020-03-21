class RoomPost < ApplicationRecord
  belongs_to :room
  belongs_to :postable, polymorphic: true
end
