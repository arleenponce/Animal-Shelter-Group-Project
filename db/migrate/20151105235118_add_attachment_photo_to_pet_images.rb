class AddAttachmentPhotoToPetImages < ActiveRecord::Migration
  def self.up
    change_table :pet_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :pet_images, :photo
  end
end
