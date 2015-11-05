class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.string :age
      t.integer :weight
      t.string :breed

      t.timestamps null: false
    end
  end
end
