class CreatePetImages < ActiveRecord::Migration
  def change
    create_table :pet_images do |t|
      t.integer :pet_id
      
      t.timestamps null: false
    end
  end
end
