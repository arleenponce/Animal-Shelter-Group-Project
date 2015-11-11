class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :breed_name
      t.timestamps null: false
    end

    create_table :breeds_pets, id: false do |t|
      t.belongs_to :breed, index: true
      t.belongs_to :pet, index: true
    end

    remove_column :pets, :breed, :string

    add_foreign_key :breeds_pets, :breeds
    add_foreign_key :breeds_pets, :pets

  end
end
