class AddNotNullConstraintToContentInCommentRoom < ActiveRecord::Migration[6.1]
  def up
    change_column :comment_rooms, :content, :string, null: false
  end

  def down
    change_column :comment_rooms, :content, :string
  end
end