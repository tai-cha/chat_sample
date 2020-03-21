class CreateRoomPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :room_posts do |t|
      t.references :room, foreign_key: true
      t.references :postable, polymorphic: true
      t.timestamps
    end
  end
end
