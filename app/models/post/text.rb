module Post
  class Text < ApplicationRecord
    include Post::Relations
  end
end
