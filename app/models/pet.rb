class Pet < ActiveRecord::Base
  has_many :pet_images, :dependent => :destroy
end
