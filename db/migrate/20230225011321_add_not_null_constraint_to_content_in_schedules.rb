class AddNotNullConstraintToContentInSchedules < ActiveRecord::Migration[6.1]
  def up
    change_column :schedules, :content, :string, null: false
  end

  def down
    change_column :schedules, :content, :string
  end
end
