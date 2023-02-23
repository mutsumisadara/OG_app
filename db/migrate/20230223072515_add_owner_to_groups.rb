class AddOwnerToGroups < ActiveRecord::Migration[6.1]
  def change
    add_index :groups, :owner_id
  end
end
