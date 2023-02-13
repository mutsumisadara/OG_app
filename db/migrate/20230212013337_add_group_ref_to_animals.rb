class AddGroupRefToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_reference :animals, :group, null: false, foreign_key: true
  end
end
