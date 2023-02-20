class AddForeignKeyToGroups < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :groups, :users, column: :owner_id, null: false, foreign_key: true
  end
end