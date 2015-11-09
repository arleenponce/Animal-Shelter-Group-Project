class Pet < ActiveRecord::Base
  has_many :pet_images, :dependent => :destroy

  accepts_nested_attributes_for :pet_images, :reject_if => lambda { |t| t['pet_image'].nil? }

end
