class CreateCommentRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_rooms do |t|
      t.text :content
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
