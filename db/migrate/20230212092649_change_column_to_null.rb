class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :animals, :group_id, null: true
  end

  def down
    change_column_null :animals, :group_id, null: false
  end
end
