class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :name, null: false
      t.boolean :sex, null: false, default: false
      t.boolean :castration, default: false
      t.text :picture
      t.date :birthday
      t.string :type
      t.string :information

      t.timestamps
    end
  end
end
