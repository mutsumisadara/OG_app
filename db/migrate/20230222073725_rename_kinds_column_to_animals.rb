class RenameKindsColumnToAnimals < ActiveRecord::Migration[6.1]
  def change
    rename_column :animals, :type, :kinds
  end
end
