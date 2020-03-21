module Post
  def self.table_name_prefix
    'post_'
  end

  module Relations
    extend ActiveSupport::Concern

    included do
      has_many :room_posts, as: :postable
      has_many :rooms, through: :room_posts
    end
  end
end
