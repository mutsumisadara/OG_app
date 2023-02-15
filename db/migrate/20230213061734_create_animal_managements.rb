class CreateAnimalManagements < ActiveRecord::Migration[6.1]
  def change
    create_table :animal_managements do |t|
      t.date :recorded_on, null: false
      t.text :content, null: false
      t.float :temprature, null: false
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
