class CreateApplicationForms < ActiveRecord::Migration
  def change
    create_table :application_forms do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip
      t.text :information

      t.timestamps null: false
    end
  end
end
